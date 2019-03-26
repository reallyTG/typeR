library(IsoGene)


### Name: exampleData
### Title: Dose-response microarray example data
### Aliases: exampleData
### Keywords: datasets

### ** Examples

data(exampleData)
x <- c(rep(1,3),rep(2,3),rep(3,3),rep(4,3))
gene1 <- as.numeric(exampleData[1,])
IsoPlot(x, gene1)



