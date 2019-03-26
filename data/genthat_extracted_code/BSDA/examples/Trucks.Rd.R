library(BSDA)


### Name: Trucks
### Title: Miles per gallon for standard 4-wheel drive trucks manufactured
###   by Chevrolet, Dodge and Ford
### Aliases: Trucks
### Keywords: datasets

### ** Examples


boxplot(mpg ~ truck, data = Trucks, horizontal = TRUE, las = 1)
summary(aov(mpg ~ truck, data = Trucks))




