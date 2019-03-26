library(phangorn)


### Name: pmlCluster
### Title: Stochastic Partitioning
### Aliases: pmlCluster
### Keywords: cluster

### ** Examples


## Not run: 
##D data(yeast)
##D dm <- dist.logDet(yeast)
##D tree <- NJ(dm)
##D fit <- pml(tree,yeast)
##D fit <- optim.pml(fit)
##D 
##D weight <- xtabs(~ index+genes,attr(yeast, "index"))
##D set.seed(1)
##D 
##D sp <- pmlCluster(edge~rate, fit, weight, p=1:4)
##D sp
##D SH.test(sp)
## End(Not run)




