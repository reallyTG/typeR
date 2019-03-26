library(CircNNTSR)


### Name: snntsloglik
### Title: SNNTS log-likelihood function for spherical data
### Aliases: snntsloglik

### ** Examples

data(Datab6fisher_ready)
data<-Datab6fisher_ready
M<-c(4,4)
cpars<-rnorm(prod(M+1))+rnorm(prod(M+1))*complex(real=0,imaginary=1)
cpars[1]<-Re(cpars[1])
cpars<- cpars/sqrt(sum(Mod(cpars)^2))
snntsdensity(data, cpars, M)
snntsloglik(data, cpars, M)



