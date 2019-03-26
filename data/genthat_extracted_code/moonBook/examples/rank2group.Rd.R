library(moonBook)


### Name: rank2group
### Title: rank a numeric vector and returns a new ordinal vector
### Aliases: rank2group

### ** Examples


require(ggplot2)
data(diamonds)
diamonds$PriceGroup=rank2group(diamonds$price,4)
table(diamonds$PriceGroup)
aggregate(price~PriceGroup,data=diamonds,range)

diamonds$PriceGroup3=rank2group(diamonds$price,3)
table(diamonds$PriceGroup3)
aggregate(price~PriceGroup3,data=diamonds,range)
diamonds$PriceGroup5=rank2group(diamonds$price,5)
table(diamonds$PriceGroup5)
aggregate(price~PriceGroup5,data=diamonds,range)



