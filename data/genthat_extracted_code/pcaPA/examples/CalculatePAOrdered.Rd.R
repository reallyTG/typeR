library(pcaPA)


### Name: CalculatePAOrdered
### Title: Parallel Analysis for Ordered Data.
### Aliases: CalculatePAOrdered
### Keywords: ordered PA

### ** Examples

# # NOT RUN
# # Run Parallel analysis for ordered polytomous data using the polycor package
# data(Science)
# Science[, ] <- lapply(Science, as.ordered)
# orderedPA <- PA(Science, percentiles = c(0.90, 0.99), nReplicates = 200,
#                 type = "ordered")
# print(orderedPA)

# # Run Parallel analysis for ordered polytomous data using 
# # he polychoric C++ function
data(Science)
Science[, ] <- lapply(Science, as.ordered)
orderedPA   <- PA(Science, percentiles = c(0.90, 0.99), nReplicates = 200,
                 type = "ordered", algorithm = "polychoric")
print(orderedPA)





