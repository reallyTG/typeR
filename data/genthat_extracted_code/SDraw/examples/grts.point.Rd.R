library(SDraw)


### Name: grts.point
### Title: Draw a equi-probable GRTS sample from a discrete (point)
###   resource.
### Aliases: grts.point
### Keywords: design survey

### ** Examples



#   Draw sample
WA.city.samp <- grts.point(WA.cities,100,50)

#   Plot
plot( WA.cities, pch=16, cex=.5 )

# Plot 'sample' locations
plot( WA.city.samp[ WA.city.samp$pointType == "Sample", ], pch=1, add=TRUE, col="red" )  

# Plot 'over sample' locations
plot( WA.city.samp[ WA.city.samp$pointType == "OverSample", ], pch=2, add=TRUE, col="blue" )  





