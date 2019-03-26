library(bayesm)


### Name: simnhlogit
### Title: Simulate from Non-homothetic Logit Model
### Aliases: simnhlogit
### Keywords: models

### ** Examples

N = 1000
p = 3
k = 1

theta = c(rep(1,p), seq(from=-1,to=1,length=p), rep(2,k), 0.5)
lnprices = matrix(runif(N*p), ncol=p)
Xexpend  = matrix(runif(N*k), ncol=k)

simdata = simnhlogit(theta, lnprices, Xexpend)



