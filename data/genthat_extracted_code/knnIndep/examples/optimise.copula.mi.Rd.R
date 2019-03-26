library(knnIndep)


### Name: optimise.copula.mi
### Title: optimize the parameter 'c' of 'generate.patchwork.copula'
### Aliases: optimise.copula.mi

### ** Examples

bins=10
knnIndep:::optimise.copula.mi(c(0.001,.01,.5,2),matrix(rbeta(bins*bins,.01,1),ncol=bins),npoints=10)



