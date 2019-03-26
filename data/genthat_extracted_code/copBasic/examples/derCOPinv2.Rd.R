library(copBasic)


### Name: derCOPinv2
### Title: Numerical Derivative Inverse of a Copula for U with respect to V
### Aliases: derCOPinv2
### Keywords: copula (utility) copula (derivative inverse) conditional
###   quantile function copula operator derivative copula (conditional
###   quantile function)

### ** Examples

u <- runif(1); t <- runif(1)
derCOPinv2(u,t, cop=W)   # perfect negative dependence
derCOPinv2(u,t, cop=P)   # independence
derCOPinv2(u,t, cop=M)   # perfect positive dependence
derCOPinv2(u,t, cop=PSP) # a parameterless copula example
## Not run: 
##D # Simulate 500 values from product (independent) copula
##D plot(NA,NA, type="n", xlim=c(0,1), ylim=c(0,1), xlab="U", ylab="V")
##D for(i in 1:500) {
##D    v <- runif(1); t <- runif(1)
##D    points(derCOPinv2(cop=P,v,t),v, cex=0.5, pch=16) # black dots
##D }
##D # Simulate 500 of a Frechet Family copula and note crossing singularities.
##D for(i in 1:500) {
##D    v <- runif(1); t <- runif(1)
##D    u <- derCOPinv2(v,t, cop=FRECHETcop, para=list(alpha=0.7, beta=0.169))
##D    points(u,v, cex=2, pch=16, col=2) # red dots
##D } #
## End(Not run)



