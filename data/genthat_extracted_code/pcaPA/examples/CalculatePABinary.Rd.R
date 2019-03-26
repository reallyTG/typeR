library(pcaPA)


### Name: CalculatePABinary
### Title: Parallel Analysis for Dichotomous Data.
### Aliases: CalculatePABinary
### Keywords: dichotomous PA

### ** Examples

# # NOT RUN
# # Run Parallel Analysis for binary data conforming to the Rasch model
# # using the polycor package
# data(simRaschData)
# binaryRaschPA <- PA(simRaschData, percentiles = c(0.95, 0.99),
#                     nReplicates = 200, type = "binary")
# print(binaryRaschPA)

# # Run Parallel Analysis for binary data conforming to the Rasch model
# # using the Cpolychoric C++ function
data(simRaschData)
binaryRaschPA <- PA(simRaschData, percentiles = c(0.95, 0.99), nReplicates = 200,
                    type = "binary", algorithm = "polychoric")
print(binaryRaschPA)

# # NOT RUN
# # Run Parallel Analysis for binary data conforming to the 2PL model
# # using the polycor package
# data(sim2plData)
# binary2plPA <- PA(sim2plData, percentiles = c(0.95, 0.99), nReplicates = 200,
#                   type = "binary")
# print(binary2plPA)

# # Run Parallel Analysis for binary data conforming to the 2PL model
# # using the polychoric C++ function
data(sim2plData)
binary2plPA <- PA(sim2plData, percentiles = c(0.95, 0.99), nReplicates = 200,
                  type = "binary", algorithm = "polychoric")
print(binary2plPA)



