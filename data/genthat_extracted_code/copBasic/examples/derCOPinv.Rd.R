library(copBasic)


### Name: derCOPinv
### Title: Numerical Derivative Inverse of a Copula for V with respect to U
### Aliases: derCOPinv
### Keywords: copula (utility) copula (derivative inverse) conditional
###   quantile function copula operator derivative copula (conditional
###   quantile function) Joe (2014) Examples and Exercises Nelsen (2006)
###   Examples and Exercises Salvadori et al. (2007) Examples and Exercises

### ** Examples

u <- runif(1); t <- runif(1)
derCOPinv(u,t, cop=W)   # perfect negative dependence
derCOPinv(u,t, cop=P)   # independence
derCOPinv(u,t, cop=M)   # perfect positive dependence
derCOPinv(u,t, cop=PSP) # a parameterless copula example
## Not run: 
##D # Simulate 500 values from product (independent) copula
##D plot(NA,NA, type="n", xlim=c(0,1), ylim=c(0,1), xlab="U", ylab="V")
##D for(i in 1:500) {
##D    u <- runif(1); t <- runif(1)
##D    points(u,derCOPinv(cop=P,u,t), cex=0.5, pch=16) # black dots
##D }
##D # Now simulate 500 from the Nelsen 4.2.12 copula.
##D for(i in 1:500) {
##D    u <- runif(1); t <- runif(1)
##D    points(u,derCOPinv(cop=N4212cop,para=9.3,u,t), cex=2, pch=16, col=2) # red dots
##D } #
## End(Not run)



