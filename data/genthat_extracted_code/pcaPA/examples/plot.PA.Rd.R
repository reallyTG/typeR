library(pcaPA)


### Name: plot.PA
### Title: Plot method for PA objects.
### Aliases: plot.PA
### Keywords: plot PA

### ** Examples

# # Run Parallel Analysis for binary data conforming to the Rasch model
# # using the polychoric C++ function
data(simRaschData)
binaryRaschPA <- PA(simRaschData, percentiles = c(0.95, 0.99), nReplicates = 200,
                    type = "binary", algorithm = "polychoric")
print(binaryRaschPA)
plot(binaryRaschPA, percentiles = 0.99, groupLabel = "") # Plots the scree-plot
                                                         # with the 99th percentile



