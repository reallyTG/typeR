library(MCDA)


### Name: normalizePerformanceTable
### Title: Function to normalize (or rescale) the columns (or criteria) of
###   a performance table.
### Aliases: normalizePerformanceTable
### Keywords: methods

### ** Examples

library(MCDA)

performanceTable <- matrix(runif(5*9), ncol=5)

row.names(performanceTable) <- c("x1","x2","x3","x4","x5","x6","x7","x8","x9")

colnames(performanceTable) <- c("g1","g2","g3","g4", "g5")

normalizationTypes <- c("percentageOfMax","rescaling",
                        "standardization","scaleToUnitLength", "none")

names(normalizationTypes) <- c("g1","g2","g3","g4","g5")

normalizedPerformanceTable <- normalizePerformanceTable(performanceTable,
                                                        normalizationTypes)




