library(gset)


### Name: equivonly
### Title: equivalence boundaries in group sequential equivalence studies
###   that only stop for equivalence
### Aliases: equivonly
### Keywords: group sequential design equivalence hypothesis equivalence
###   boundary

### ** Examples

 ## Not run: 
##D   L <- -0.2
##D   U <- 0.2
##D   sigma <- 0.4  
##D   alpha <- 0.05
##D   beta  <- 0.2
##D   K <- 4
##D   
##D   # the sample size per group with a traditional nonsequential design
##D   n.fix <- nfix(r, L,U,theta,sigma,alpha,beta)
##D   
##D   
##D   # default 
##D   # there are two ways to generate the boundary plots
##D   # 1. specify plot=TRUE (default) in "binding()"
##D   equivonly(L, U, sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha)             
##D   
##D   # 2. specify plot=FALSE in "binding()" and apply the "figureE()" command 
##D   bound  <- equivonly(L, U,  sigma, n.fix$n1, n.fix$n2, 1:K/K, alpha, plot=FALSE)  
##D   figureE(bound, K)
##D   
## End(Not run)



