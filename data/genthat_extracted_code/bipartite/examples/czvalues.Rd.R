library(bipartite)


### Name: czvalues
### Title: Computes c and z for network modules
### Aliases: czvalues
### Keywords: package

### ** Examples

## Not run: 
##D data(memmott1999)
##D set.seed(2)
##D mod <- computeModules(memmott1999, steps=1E4)
##D cz <- czvalues(mod)
##D plot(cz[[1]], cz[[2]], pch=16, xlab="c", ylab="z", cex=0.8, xlim=c(0,1), las=1)
##D abline(v=0.62) # threshold of Olesen et al. 2007
##D abline(h=2.5)   # dito
##D text(cz[[1]], cz[[2]], names(cz[[1]]), pos=4, cex=0.7)
## End(Not run)



