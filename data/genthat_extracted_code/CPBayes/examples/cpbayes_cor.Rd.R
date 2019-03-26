library(CPBayes)


### Name: cpbayes_cor
### Title: Run correlated version of CPBayes.
### Aliases: cpbayes_cor

### ** Examples

data(ExampleDataCor)
BetaHat <- ExampleDataCor$BetaHat
BetaHat
SE <- ExampleDataCor$SE
SE
cor <- ExampleDataCor$cor
cor
traitNames <- paste("Disease", 1:10, sep = "")
SNP1 <- "rs1234"
result <- cpbayes_cor(BetaHat, SE, cor, Phenotypes = traitNames, Variant = SNP1)
str(result)




