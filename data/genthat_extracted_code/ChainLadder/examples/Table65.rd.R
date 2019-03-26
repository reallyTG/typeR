library(ChainLadder)


### Name: Table65
### Title: Functions to Reproduce Clark's Tables
### Aliases: Table65 Table64 Table68
### Keywords: methods

### ** Examples

Table65(ClarkLDF(GenIns, maxage=20))
Table64(ClarkLDF(GenIns, maxage=20))

X <- GenIns
colnames(X) <- 12*as.numeric(colnames(X))
Table65(ClarkCapeCod(X, Premium=10000000+400000*0:9, maxage=Inf))
Table68(ClarkCapeCod(X, Premium=10000000+400000*0:9, maxage=Inf))




