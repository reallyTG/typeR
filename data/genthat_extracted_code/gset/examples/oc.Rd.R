library(gset)


### Name: oc
### Title: examination of the operating characteristics of a group
###   sequential design for equivalence studies
### Aliases: oc
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
##D   n.fix <- nfix(r, L,U,theta,sigma,alpha,beta)
##D   
##D   bound1 <- nonbinding(L,U,theta,sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha,beta, plot=FALSE) 
##D   bound2<- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)
##D   
##D   theta <- L 
##D   oc1 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound1, futility=TRUE)
##D   oc2 <- oc(L, U, theta, sigma, K, bound2$n1minmax, bound2$n2minmax, bound2, futility=TRUE)
##D   
##D   theta <- 0 
##D   oc3 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound1, futility=TRUE)
##D   oc4 <- oc(L, U, theta, sigma, K, bound2$n1minmax, bound2$n2minmax, bound2, futility=TRUE)
##D   
## End(Not run)




