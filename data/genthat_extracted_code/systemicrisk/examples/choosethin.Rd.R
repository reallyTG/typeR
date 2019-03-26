library(systemicrisk)


### Name: choosethin
### Title: Calibrate Thinning
### Aliases: choosethin

### ** Examples

n <- 10
m <- Model.Indep.p.lambda(Model.p.BetaPrior(n),
                          Model.lambda.GammaPrior(n,scale=1e-1))
x <- genL(m)
l <- rowSums(x$L)
a <- colSums(x$L)
## Not run: 
##D choosethin(l,a,model=m)
##D choosethin(l,a,model=m,relESStarget=0.7)
## End(Not run)



