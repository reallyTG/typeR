library(gset)


### Name: binding
### Title: equivalence and binding futility boundaries in group sequential
###   equivalence studies
### Aliases: binding
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
##D   # the sample size per group with a traditional nonsequential design
##D   n.fix <- nfix(r, L,U,theta,sigma,alpha,beta)
##D   
##D   
##D   # default 
##D   # there are two ways to generate the boundary plots
##D   # 1. specify plot=TRUE (default) in "binding()"
##D   binding(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta)             
##D   
##D   # 2. specify plot=FALSE in "binding()" and apply the "figureEF()" command 
##D   bound  <- binding(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta, plot=FALSE)  
##D   figureEF(bound, K)
##D 
##D   # obtain nminmax
##D   bound  <- nminmax(L, U, theta, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, beta, binding=TRUE)
##D   bound
##D   figureEF(bound, K)
##D   
## End(Not run)



