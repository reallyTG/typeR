library(phylolm)


### Name: stepwise.test.tree
### Title: Fits a population tree to data from quartet concordance factors
### Aliases: stepwise.test.tree

### ** Examples

data(quartetCF)
data(guidetree)
## No test: 
resF <- stepwise.test.tree(quartetCF,guidetree,startT="fulltree") # takes ~ 1 min
resF[1:9]
## End(No test)



