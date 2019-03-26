library(equSA)


### Name: equSA-package
### Title: Graphical model has been widely used in may scientific fileds to
###   describe the conditional independent relationships for a large set of
###   random variables. Through this package, we provide tools to learn
###   both undirected graph (Markov Random Field) and directed acyclic
###   graph (Bayesian Network). p
### Aliases: equSA-package
### Keywords: package

### ** Examples

## Don't show: 
library(equSA)
data(TR0)
subset <- TR0[1:100,1:10]
equSAR(subset,GRID=2,iteration=100)
## End(Don't show)
## No test: 
library(equSA)
data(TR0)
subset <- TR0
equSAR(subset)
## End(No test)




