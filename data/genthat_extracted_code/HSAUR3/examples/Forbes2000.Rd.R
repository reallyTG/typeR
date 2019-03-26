library(HSAUR3)


### Name: Forbes2000
### Title: The Forbes 2000 Ranking of the World's Biggest Companies (Year
###   2004)
### Aliases: Forbes2000
### Keywords: datasets

### ** Examples

data("Forbes2000", package = "HSAUR3")
summary(Forbes2000)
### number of countries
length(levels(Forbes2000$country))
### number of industries
length(levels(Forbes2000$category))



