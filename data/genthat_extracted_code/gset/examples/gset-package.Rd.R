library(gset)


### Name: gset-package
### Title: group sequentail design of equivalenc studies based on exact
###   bivariate t statistics
### Aliases: gset-package gset
### Keywords: package group sequential design equivalence hypothesis
###   equivalence boundary futility boundary

### ** Examples

 ## Not run: 
##D  
##D   L <- -0.2
##D   U <- 0.2
##D   theta <- 0
##D   sigma <- 0.4  
##D   alpha <- 0.05
##D   beta  <- 0.2
##D   K <- 4
##D   r <- 1 
##D   
##D   # non-sequential
##D   n.fix <- nfix(r, L,U,theta,sigma,alpha,beta)
##D 
##D   # sequential without futility
##D   bound1<- equivonly(L, U,  sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)  
##D   # figureE (bound1, K)
##D   
##D   # sequential with nonbinding futility
##D   bound2  <- nonbinding(L,U,theta,sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha,beta) 
##D 
##D   # sequential with binding futility
##D   bound3  <- binding(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta) 
##D    
##D   # finding nminmax with nonbinding futility
##D   bound4  <- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)
##D   figureEF(bound4, K)
##D 
##D   # finding nminmax with binding futility
##D   bound5  <- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)
##D   figureEF(bound5, K)
##D 
##D 
##D   # operating characteristics under H0
##D   theta <- L 
##D   oc1 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound1, futility=FALSE)
##D   oc2 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound2, futility=TRUE)  
##D   oc3 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound3, futility=TRUE, binding=TRUE)  
##D   oc4 <- oc(L, U, theta, sigma, K, bound4$n1minmax, bound4$n2minmax, bound4, futility=TRUE)  
##D   oc5 <- oc(L, U, theta, sigma, K, bound5$n1minmax, bound5$n2minmax, bound5, 
##D   futility=TRUE, binding=TRUE)  
##D 
##D 
##D   # operating characteristics under H1
##D   theta <- 0
##D   oc6 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound1, futility=FALSE)
##D   oc7 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound2, futility=TRUE)  
##D   oc8 <- oc(L, U, theta, sigma, K, n.fix$n1, n.fix$n2, bound3, futility=TRUE, binding=TRUE)  
##D   oc9 <- oc(L, U, theta, sigma, K, bound4$n1minmax, bound4$n2minmax, bound4, futility=TRUE)  
##D   oc10<- oc(L, U, theta, sigma, K, bound5$n1minmax, bound5$n2minmax, bound5, 
##D   futility=TRUE, binding=TRUE)  
##D  
## End(Not run)



