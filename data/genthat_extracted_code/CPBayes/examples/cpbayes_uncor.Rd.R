library(CPBayes)


### Name: cpbayes_uncor
### Title: Run uncorrelated version of CPBayes.
### Aliases: cpbayes_uncor

### ** Examples

data(ExampleDataUncor)
BetaHat <- ExampleDataUncor$BetaHat
BetaHat
SE <- ExampleDataUncor$SE
SE
traitNames <- paste("Disease", 1:10, sep = "")
SNP1 <- "rs1234"
result <- cpbayes_uncor(BetaHat, SE, Phenotypes = traitNames, Variant = SNP1)
str(result)




