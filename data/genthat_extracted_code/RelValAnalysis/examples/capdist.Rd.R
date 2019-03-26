library(RelValAnalysis)


### Name: capdist
### Title: Captial-distribution Objects
### Aliases: capdist

### ** Examples

# Create a random distribution
x <- runif(100)
x <- x/sum(x)
x <- capdist(x)
plot(x)



