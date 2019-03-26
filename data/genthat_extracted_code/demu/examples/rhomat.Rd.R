library(demu)


### Name: rhomat
### Title: Calculate the correlation matrix according to the squared
###   exponential family of models.
### Aliases: rhomat

### ** Examples

library(demu)

design=matrix(runif(10,0,1),ncol=2,nrow=5)
rho=rep(0.01,2)
l.d=makedistlist(design)
R=rhomat(l.d,rho)$R
R



