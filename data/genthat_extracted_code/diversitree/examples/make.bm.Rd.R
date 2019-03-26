library(diversitree)


### Name: make.bm
### Title: Brownian Motion and Related Models of Character Evolution
### Aliases: make.bm make.ou make.eb make.lambda
### Keywords: models

### ** Examples

## Random data (following APE)
data(bird.orders)
set.seed(1)
x <- structure(rnorm(length(bird.orders$tip.label)),
               names=bird.orders$tip.label)

## Not run: 
##D ## With the VCV approach
##D fit1 <- find.mle(make.bm(bird.orders, x), .1)
##D 
##D ## With the pruning calculations
##D lik.pruning <- make.bm(bird.orders, x, control=list(method="pruning"))
##D fit2 <- find.mle(lik.pruning, .1)
##D 
##D ## All the same (need to drop the function from this though)
##D all.equal(fit1[-7], fit2[-7])
##D 
##D ## If this is the same as the estimates from Geiger, to within the
##D ## tolerances expected for the calculation and optimisation:
##D fit3 <- fitContinuous(bird.orders, x)
##D all.equal(fit3$Trait1$lnl, fit1$lnLik)
##D all.equal(fit3$Trait1$beta, fit1$par, check.attributes=FALSE)
## End(Not run)




