library(mvSLOUCH)


### Name: fitch.mvsl
### Title: Unordered Fitch parsimony reconstruction of discrete character
###   states
### Aliases: fitch.mvsl
### Keywords: models htest

### ** Examples

set.seed(12345)
phyltree<-ape::rtree(5)

regimes<-c("A","B","B","C","C")
regimesFitch<-fitch.mvsl(phyltree,regimes,root=1,deltran=TRUE)



