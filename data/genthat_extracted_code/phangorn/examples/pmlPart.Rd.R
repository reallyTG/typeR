library(phangorn)


### Name: multiphyDat2pmlPart
### Title: Partition model.
### Aliases: multiphyDat2pmlPart pmlPart2multiPhylo pmlPart
### Keywords: cluster

### ** Examples


data(yeast)
dm <- dist.logDet(yeast)
tree <- NJ(dm)
fit <- pml(tree,yeast)
fits <- optim.pml(fit)

weight=xtabs(~ index+genes,attr(yeast, "index"))[,1:10]

sp <- pmlPart(edge ~ rate + inv, fits, weight=weight)
sp

## Not run: 
##D sp2 <- pmlPart(~ edge + inv, fits, weight=weight)
##D sp2
##D AIC(sp2)
##D 
##D sp3 <- pmlPen(sp2, lambda = 2) 
##D AIC(sp3)
## End(Not run)




