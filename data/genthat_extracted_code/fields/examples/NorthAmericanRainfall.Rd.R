library(fields)


### Name: NorthAmericanRainfall
### Title: Observed North American summer precipitation from the historical
###   climate network.
### Aliases: NorthAmericanRainfall
### Keywords: datasets

### ** Examples

data(NorthAmericanRainfall)
x<- cbind(NorthAmericanRainfall$longitude,  NorthAmericanRainfall$latitude)
y<- NorthAmericanRainfall$precip
quilt.plot( x,y)
world( add=TRUE)

Zstat<- NorthAmericanRainfall$trend / NorthAmericanRainfall$trendSE
quilt.plot( x, Zstat)




