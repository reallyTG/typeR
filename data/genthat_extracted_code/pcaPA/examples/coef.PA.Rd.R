library(pcaPA)


### Name: coef.PA
### Title: Eigenvalue and percentile extraction of a '"PA"' object.
### Aliases: coef.PA
### Keywords: coef methods

### ** Examples

# # Run Parallel Analysis for binary data conforming to the Rasch model
data(simRaschData)
binaryRaschPA <- PA(simRaschData, percentiles = c(0.95, 0.99), nReplicates = 200,
                    type = "binary", algorithm = "polychoric")
print(binaryRaschPA)
binaryRaschPAEigenValues <- coef(binaryRaschPA)  # Save the matrix of observed
                                                 # eigenvalues and estimated
                                                 # eigenvalue percentiles
binaryRaschPAEigenValues




