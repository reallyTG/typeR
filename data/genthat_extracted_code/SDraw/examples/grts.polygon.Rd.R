library(SDraw)


### Name: grts.polygon
### Title: Draw a equi-probable GRTS sample from an area (polygon)
###   resource.
### Aliases: grts.polygon
### Keywords: design survey

### ** Examples


#   Draw sample
WA.sample <- grts.polygon(WA,100,50)

#   Plot
plot( WA )

# Plot 'sample' locations
plot( WA.sample[ WA.sample$pointType == "Sample", ], pch=16, add=TRUE, col="red" )  

# Plot 'over sample' locations
plot( WA.sample[ WA.sample$pointType == "OverSample", ], pch=1, add=TRUE, col="blue" )  






