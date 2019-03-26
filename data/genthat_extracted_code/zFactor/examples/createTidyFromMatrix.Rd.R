library(zFactor)


### Name: createTidyFromMatrix
### Title: Create a tidy table from Ppr and Tpr vectors
### Aliases: createTidyFromMatrix

### ** Examples

ppr <- c(0.5, 1.5, 2.5, 3.5)
tpr <- c(1.05, 1.1, 1.2)
createTidyFromMatrix(ppr, tpr, correlation = "DAK")
createTidyFromMatrix(ppr, tpr, correlation = "BB")



