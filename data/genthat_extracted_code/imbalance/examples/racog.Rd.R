library(imbalance)


### Name: racog
### Title: Rapidly converging Gibbs algorithm.
### Aliases: racog

### ** Examples

data(iris0)

# Generates new minority examples

newSamples <- racog(iris0, numInstances = 40, burnin = 20, lag = 10,
                    classAttr = "Class")
## No test: 
newSamples <- racog(iris0, numInstances = 100)
## End(No test)



