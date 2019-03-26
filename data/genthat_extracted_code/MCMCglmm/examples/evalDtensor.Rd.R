library(MCMCglmm)


### Name: evalDtensor
### Title: Evaluates a list of (mixed) partial derivatives
### Aliases: evalDtensor
### Keywords: math array

### ** Examples

f<-expression(beta_1 + time*beta_2+u)
Df<-Dtensor(f, eval=FALSE, m=2)
evalDtensor(Df, mu=data.frame(beta_1=0.5, beta_2=1, time=3, u=2.3))
Dtensor(f, mu=c(1,3,1,2.3), m=2)



