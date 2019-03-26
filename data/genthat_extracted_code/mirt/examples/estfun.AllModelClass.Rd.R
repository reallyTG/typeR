library(mirt)


### Name: estfun.AllModelClass
### Title: Extract Empirical Estimating Functions
### Aliases: estfun.AllModelClass
### Keywords: scores

### ** Examples


## Not run: 
##D mod1 <- mirt(expand.table(LSAT7), 1, SE = TRUE, SE.type = "crossprod")
##D (sc1 <- estfun.AllModelClass(mod1))
##D colSums(sc1)
##D vc1 <- vcov(mod1)
##D all.equal(crossprod(sc1), chol2inv(chol(vc1)), check.attributes = FALSE)
##D 
##D group <- rep(c("G1", "G2"), 500)
##D mod2 <- multipleGroup(expand.table(LSAT7), 1, group, SE = TRUE,
##D   SE.type = "crossprod")
##D (sc2 <- estfun.AllModelClass(mod2))
##D colSums(sc2)
##D vc2 <- vcov(mod2)
##D all.equal(crossprod(sc2), chol2inv(chol(vc2)), check.attributes = FALSE)
##D 
## End(Not run)



