library(phangorn)


### Name: SOWH.test
### Title: Swofford-Olsen-Waddell-Hillis Test
### Aliases: SOWH.test
### Keywords: models

### ** Examples


# in real analysis use larger n, e.g. 500 preferably more
## Not run: 
##D data(Laurasiatherian)
##D dm <- dist.logDet(Laurasiatherian)
##D tree <- NJ(dm)
##D fit <- pml(tree, Laurasiatherian)
##D fit <- optim.pml(fit, TRUE)
##D set.seed(6)
##D tree <- rNNI(fit$tree, 1)
##D fit <- update(fit, tree = tree)
##D (res <- SOWH.test(fit, n=100))
##D summary(res)
## End(Not run)




