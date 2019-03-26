library(minxent)


### Name: minxent.single
### Title: Minimum Cross Entropy Distribution under One Constraint
### Aliases: minxent.single

### ** Examples

q <- c(0.05,0.10,0.15,0.20,0.22,0.28) # a priori distribution
G <- matrix(c(rep(1,6),1:6),byrow=TRUE,nrow=2) # matrix of moment vector function of observed data
eta <- c(1,4.5) # vector of moment constraints
minxent.single(q=q,G=G,eta=eta,c(0)) # estimate of lagrangian multipliers and Kullback minimimum cross entropy distribution



