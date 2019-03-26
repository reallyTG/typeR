library(copBasic)


### Name: gEVcop
### Title: The Gaussian-based (Extreme Value) Copula
### Aliases: gEVcop
### Keywords: g-EV copula copula (formulas) copula package copula
###   (comparison to) copula (extreme value) extreme value copula

### ** Examples

## Not run: 
##D UV <- simCOP(200, cop=gEVcop, para=0.8) #
## End(Not run)

## Not run: 
##D # Joe (2014, p. 105) has brief detail indicating rho = [0,1] and though it seems
##D # rho would be a Pearson correlation, this does not seem to be the case. The Rho
##D # seems to start with that of the Gaussian and then through the extreme-value
##D # transform, it just assumes the role of a parameter?
##D rho <- 0.8
##D UV <- simCOP(2000, cop=gEVcop, para=rho)
##D P <- cor(UV[,1], UV[,2], method="pearson")
##D if(abs(P-0.8) < 0.001) {
##D   print("Yet same")
##D } else { print("nope not") } # Should they be?
## End(Not run)

## Not run: 
##D r <- seq(0.01,1, by=.01)
##D R <- sapply(rhos, function(k) rhoCOP(cop=gEVcop, para=k))
##D #
## End(Not run)



