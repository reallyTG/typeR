library(eiwild)


### Name: prioriPlot
### Title: plots beta^{rc} given hyperpriori parameters
### Aliases: prioriPlot

### ** Examples

## Not run: 
##D test1 <- prioriPlot(list(shape=4,rate=2), "gamma",cols=4)
##D str(test1)
##D 
##D pars <- list(shape=matrix(1:9,3,3),rate=matrix(9:1,3,3))
##D test2 <- prioriPlot(pars, "gamma",breaks=100)
##D test3 <- prioriPlot(list(shape=8,rate=2),"gamma",breaks=100,cols=3)
##D 
##D pars4 <- list(shape=matrix(c(6,6,6),1,3), rate=matrix(c(4,4,4),1,3))
##D test4 <- prioriPlot(pars4, "gamma",breaks=100)
##D 
##D pars5 <- list(lam=2)
##D test5 <- prioriPlot(pars5, "expo",cols=4, breaks=100)
##D 
##D pars6 <- list(lam=matrix(1:9,3,3)/100)
##D test6 <- prioriPlot(pars6, "expo", breaks=25, col=grey(0.8))
##D 
##D # example for 3x4-table
##D set.seed(568)
##D pars7 <- list(shape=matrix(sample(1:20,12), 3,4), rate=matrix(sample(1:20,12),3,4))
##D test7 <- prioriPlot(pars7, "gamma",breaks=50)
## End(Not run)



