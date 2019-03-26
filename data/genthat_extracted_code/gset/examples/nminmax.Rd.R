library(gset)


### Name: nminmax
### Title: sample size calculation for group sequential equivalence studies
### Aliases: nminmax
### Keywords: group sequential design equivalence hypothesis equivalence
###   boundary futility boundary

### ** Examples

 ## Not run: 
##D   L <- -0.2
##D   U <- 0.2
##D   theta <- 0
##D   sigma <- 0.4  
##D   alpha <- 0.05
##D   beta  <- 0.2
##D   K <- 4
##D   r <- 1
##D   
##D   # the sample size per group with a traditional nonsequential design
##D   n.fix <- nfix(r, L,U,theta,sigma,alpha,beta)
##D   
##D   # nminmax with nonbinding futility
##D   bound1  <- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)
##D   figureEF(bound1, K)
##D 
##D   # nminmax with binding futility
##D   bound2  <- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta, binding=TRUE)
##D   figureEF(bound2, K)
##D   
## End(Not run)



