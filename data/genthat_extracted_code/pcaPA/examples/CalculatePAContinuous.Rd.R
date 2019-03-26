library(pcaPA)


### Name: CalculatePAContinuous
### Title: Parallel Analysis for continuous data.
### Aliases: CalculatePAContinuous
### Keywords: continuous PA

### ** Examples


# # Run Parallel analyis of numeric data (Iris)
data(iris)
continuousPA <- PA(iris[, -5], percentiles = c(0.90, 0.99), nReplicates = 200,
                   type = "continuous", algorithm = "pearson")
print(continuousPA)



