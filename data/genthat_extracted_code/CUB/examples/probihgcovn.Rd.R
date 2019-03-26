library(CUB)


### Name: probihgcovn
### Title: Probability distribution of an IHG model with covariates
### Aliases: probihgcovn
### Keywords: distribution

### ** Examples

n<-100
m<-7
theta<-0.30
ordinal<-simihg(n,m,theta)
U<-sample(c(0,1),n,replace=TRUE)
nu<-c(0.12,-0.5)
pr<-probihgcovn(m,ordinal,U,nu)



