library(RelValAnalysis)


### Name: plot.capdist
### Title: Plotting Captial Distribution Objects
### Aliases: plot.capdist

### ** Examples

# Create a random distribution
x <- runif(100)
x <- x/sum(x)
x <- capdist(x)
plot(x)



