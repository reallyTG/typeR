library(pcaPA)


### Name: PA
### Title: General function to perform parallel analysis of continuous,
###   ordered or mixed type data.
### Aliases: PA
### Keywords: Parallel Analysis ParallelA PA

### ** Examples

# # NOT RUN
# # Run Parallel Analysis for binary data conforming to the Rasch model
# # using the polycor package
# data(simRaschData)
# binaryRaschPA <- PA(simRaschData, percentiles = c(0.95, 0.99), nReplicates = 200,
#                     type = "binary")
# print(binaryRaschPA)

# # Run Parallel Analysis for binary data conforming to the Rasch model
# # using the polychoric C++ function
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

# # NOT RUN
# # Run Parallel analysis for ordered polytomous data using the polycor package
# data(Science)
# Science[, ] <- lapply(Science, as.ordered)
# orderedPA <- PA(Science, percentiles = c(0.90, 0.99), nReplicates = 200,
#                 type = "ordered")
# print(orderedPA)

# # Run Parallel analysis for ordered polytomous data using the polychoric C++ function
data(Science)
Science[, ] <- lapply(Science, as.ordered)
orderedPA   <- PA(Science, percentiles = c(0.90, 0.99), nReplicates = 200,
                  type = "ordered", algorithm = "polychoric")
print(orderedPA)

# # NOT RUN
# # Run Parallel analysis of mixed ordered and continuous data
# data(mixedScience)
# mixedPA <- PA(mixedScience, percentiles = c(0.90, 0.99), nReplicates = 200,
#               type = "mixed")
# print(mixedPA)

# # Run Parallel analyis of numeric data (Iris)
data(iris)
continuousPA <- PA(iris[, -5], percentiles = c(0.90, 0.99), nReplicates = 200,
                   type = "continuous", algorithm = "pearson")
print(continuousPA)



