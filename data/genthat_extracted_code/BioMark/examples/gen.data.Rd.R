library(BioMark)


### Name: gen.data
### Title: Simulate data sets
### Aliases: gen.data gen.data2
### Keywords: manip multivariate

### ** Examples

## Not run: 
##D X <- gen.data(10, nvar = 200)
##D names(X)
##D dim(X$X)
##D 
##D set.seed(7)
##D simdat <- gen.data(10, nvar = 1200, nbiom = 22, nsimul = 1,
##D                    group.diff = 2)
##D simdat.stab <- get.biom(simdat$X[,,1], simdat$Y, fmethod = "all",
##D                         type = "stab", ncomp = 3, scale.p = "auto")
##D ## show LASSO success
##D traceplot(simdat.stab, lty = 1, col = rep(2:1, c(22, 1610)))
##D 
##D data(SpikePos)
##D real.markers <- which(SpikePos$annotation$found.in.standards > 0)
##D X.no.diff <- SpikePos$data[1:20, -real.markers]
##D 
##D set.seed(7)
##D simdat2 <- gen.data2(X.no.diff, ncontrol = 10, nbiom = 22,
##D                      spikeI = c(1.2, 1.4, 2), nsimul = 1)
##D simdat2.stab <- get.biom(simdat2$X[,,1], simdat$Y,
##D                          fmethod = "all", type = "stab", ncomp = 3,
##D                          scale.p = "auto")
##D ## show LASSO success
##D traceplot(simdat2.stab, lty = 1, col = rep(2:1, c(22, 1610)))
## End(Not run)



