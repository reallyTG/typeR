library(IsoGene)


### Name: dopamine
### Title: Dose-response microarray example data
### Aliases: dopamine
### Keywords: datasets

### ** Examples

data(dopamine)
require(Biobase)
express <- data.frame(exprs(dopamine))
dose <- unlist(pData(dopamine))
IsoPlot(dose,express[56,],type="continuous", add.curve=TRUE)




