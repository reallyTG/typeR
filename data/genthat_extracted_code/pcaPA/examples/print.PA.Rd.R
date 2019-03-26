library(pcaPA)


### Name: print.PA
### Title: Print method for PA objects.
### Aliases: print.PA
### Keywords: print methods

### ** Examples

# # Run Parallel Analysis for binary data conforming to the Rasch model
# # using the polycor package
data(simRaschData)
binaryRaschPA <- PA(simRaschData, percentiles = c(0.95, 0.99), nReplicates = 200,
                    type = "binary", algorithm = "polychoric")
print(binaryRaschPA)



