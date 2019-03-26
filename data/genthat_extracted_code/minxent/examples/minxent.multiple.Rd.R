library(minxent)


### Name: minxent.multiple
### Title: Minimum Cross Entropy Distribution under Multiple Constraints
### Aliases: minxent.multiple

### ** Examples

xi <- 1:6 
eta<-c(1,4,19)  #expected moment constraints 
q<-c(rep(1/6),6)  #a priori distribution 
G<-matrix(c(rep(1,6),xi,xi^2),byrow=TRUE,nrow=3) #matrix of moment vector function of observed data
minxent.multiple(q=q,G=G,eta=eta,c(0,0)) #estimates of lagrangian multipliers and MinxEnt distribution



