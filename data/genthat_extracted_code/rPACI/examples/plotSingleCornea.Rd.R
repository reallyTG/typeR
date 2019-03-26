library(rPACI)


### Name: plotSingleCornea
### Title: Summary plot of the Placido irregularity indices
### Aliases: plotSingleCornea

### ** Examples

dataset = readCornealTopography(system.file("extdata","K04.txt", package="rPACI"))
results = computePlacidoIndices(dataset)
plotSingleCornea(dataset, results)



