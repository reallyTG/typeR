library(SDraw)


### Name: grts.line
### Title: Draw a equi-probable GRTS sample from a linear (line) resource.
### Aliases: grts.line
### Keywords: design survey

### ** Examples


# Draw sample
HI.sample <- grts.line(HI.coast,100,50)

# Plot
plot( HI.coast )

# Plot 'sample' locations
plot( HI.sample[ HI.sample$pointType == "Sample", ], pch=16, add=TRUE, col="red" )  

# Plot 'over sample' locations
plot( HI.sample[ HI.sample$pointType == "OverSample", ], pch=1, add=TRUE, col="blue" )  






