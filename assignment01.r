### 
# Name: Rajasekhar Reddy Mekala
# ZId: Z1813116
#
# Assignment01: Fruit Graphing
#
# I certify this is my work and my work alone, if I used additional sources I will document
# it in comments. 
#							Rajasekhar
#
#####

#Loads the data file
applebananapear = read.csv('AppleBananaPear.csv') 
#Selects only the data with "Spain" from dataset, column == Area
spainapplebananapear = applebananapear[grep("Spain", applebananapear$Area),]
#Selects only the data from Spain where the Item is a "Pear"
spainapple = spainapplebananapear[grep("Pear", spainapplebananapear$Item),]
#Plots years on the x axis and amount of pears produced on y axis
plot(spainapple$Year, spainapple$Value)
#Connects the points with a line
lines(spainapple$Year, spainapple$Value)

# Part 1
# Produce a graph of the country with the largest production of apples in a single year. That 
# is find the country that has the largest production of apples, then plot its production for 
# all the years associated with that country.

# enter your Part 1 code here

applebananapear = read.csv('AppleBananaPear.csv') 
apples = applebananapear[grep("^Apples$", applebananapear$Item),]
areawisecount = aggregate(apples$Value, by=list(Area=apples$Area), FUN=sum)
 reorder <- order(areawisecount$x)

chainaapplebananapear = applebananapear[grep("^China$", applebananapear$Area),]
chinaapple = chainaapplebananapear[grep("Apples", chainaapplebananapear$Item),]
options(scipen = 999)
plot(chinaapple$Year, chinaapple$Value,
     col = "red",
     lwd = 3,
     ylab = "No.Of Tonnes",
     xlab = "Production Year's",
     main = "China's Apple Production"
)

# Part 1a
# Three things wrong with sample graph
# 1. No Title
# 2. X-Axis and Y-Axis names are not defined
# 3. Y-axis doesn't started with 0


# Part 2
# Pick 3 different countries and plot the production of apples for each year for each country 
# in a single graph.

# enter your Part 2 code here

install.packages("reshape2")
library(reshape2)

install.packages("ggplot2")

library(ggplot2)

applebananapear = read.csv('AppleBananaPear.csv')
indiaapplebananapear = applebananapear[grep("^India$", applebananapear$Area),]
indiaapple = chainaapplebananapear[grep("Apples", indiaapplebananapear$Item),]
japanapplebananapear = applebananapear[grep("^Japan$", applebananapear$Area),]
japanapple = japanapplebananapear[grep("Apples", japanapplebananapear$Item),]
ussrapplebananapear = applebananapear[grep("^USSR$", applebananapear$Area),]
ussrapple = ussrapplebananapear[grep("Apples", ussrapplebananapear$Item),]
threecountries = rbind(indiaapple, japanapple,ussrapple)


mainplot <- ggplot(threecountries, aes(x = Year, y = Value, colour = Area))+
  geom_point()

mainplot + labs(colour = "Area") + labs(x = "Production Years") + labs(y = "Apples Production Value in Tonnes") + labs(title = "Apples Production of Three Countries Yearly Wise")

# Part 3
# Plot the production of apples, bananas and pears for the United States on a single graph.

# enter your Part 3 code here

usapplebananapears=applebananapear[grep("^United States of America$", applebananapear$Area),]

secondplot <- ggplot(usapplebananapears, aes(x = Year, y = Value, colour = Item))+
  geom_bar(stat="identity", fill="white")
secondplot + labs(x = "Production Years") + labs(y = "Production Value in Tonnes") + labs(title = "Production of Apples, Bananas and Pears in US for Each Year")


