library(pcaPA)


### Name: quantile.PA
### Title: Generate new quantiles based on given percentiles for a PA
###   object.
### Aliases: quantile.PA
### Keywords: quantile PA

### ** Examples

# # Using the polychoric C++ function
data(Science)
Science[, ] <- lapply(Science, as.ordered)
orderedPA   <- PA(Science, percentiles = c(0.90, 0.99), nReplicates = 200,
                  type = "ordered", algorithm = "polychoric")

print(orderedPA)  # Shows the eigenvalues as a matrix
head(orderedPA$simulatedEigenValues)  # Shows the first six iterations

# # Get different quantiles from a PA object
quantile(orderedPA, percentiles = c(0.1, 0.2, 0.5))



