library(RelValAnalysis)


### Name: CapDistSlope
### Title: Slope of a Capital Distribution Curve
### Aliases: CapDistSlope

### ** Examples

# Create a random distribution
x <- runif(100)
x <- x/sum(x)
x <- capdist(x)
CapDistSlope(x)



