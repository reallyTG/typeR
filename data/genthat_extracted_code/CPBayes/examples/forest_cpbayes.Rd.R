library(CPBayes)


### Name: forest_cpbayes
### Title: Forest plot presenting pleiotropy result obtained by CPBayes.
### Aliases: forest_cpbayes

### ** Examples

data(ExampleDataUncor)
BetaHat <- ExampleDataUncor$BetaHat
SE <- ExampleDataUncor$SE
traitNames <- paste("Disease", 1:10, sep = "")
SNP1 <- "rs1234"
result <- cpbayes_uncor(BetaHat, SE, Phenotypes = traitNames, Variant = SNP1)
forest_cpbayes(result, level = 0.05)




