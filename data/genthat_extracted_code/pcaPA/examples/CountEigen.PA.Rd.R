library(pcaPA)


### Name: CountEigen.PA
### Title: Number of observed eigenvalues that exceed a given set of
###   percentiles.
### Aliases: CountEigen.PA
### Keywords: PA

### ** Examples


# # Run Parallel Analysis for binary data conforming to the Rasch model
data(simRaschData)
binaryRaschPA <- PA(simRaschData, percentiles = c(0.95, 0.99), nReplicates = 200,
                    type = "binary", algorithm = "polychoric")
print(binaryRaschPA)

# # Number of retained factors
nComponents <- CountEigen.PA(binaryRaschPA, percentiles = .99)
nComponents["p99"]

# # Run Parallel Analysis for binary data conforming to the 2PL model
data(sim2plData)
binary2plPA <- PA(sim2plData, percentiles = c(0.95, 0.99), nReplicates = 200,
                  type = "binary", algorithm = "polychoric")
print(binary2plPA)

# # Number of retained factors
nComponents <- CountEigen.PA(binary2plPA, percentiles = .99)
nComponents["p99"]




