library(ald)


### Name: mleALD
### Title: Maximum Likelihood Estimators (MLE) for the Asymmetric Laplace
###   Distribution
### Aliases: mleALD
### Keywords: asymmetric laplace distribution quantile regression Laplace
###   MLE Maximum likelihood estimators ALD

### ** Examples

## Let's try this function

param = c(-323,40,0.9)
y = rALD(10000,mu = param[1],sigma = param[2],p = param[3])  #A random sample
res = mleALD(y)

#Comparing
cbind(param,res$par)

#Let's plot

seqq = seq(min(y),max(y),length.out = 1000)
dens = dALD(y=seqq,mu=res$par[1],sigma=res$par[2],p=res$par[3])
hist(y,breaks=50,freq = FALSE,ylim=c(0,max(dens)))
lines(seqq,dens,type="l",lwd=2,col="red",xlab="x",ylab="f(x)", main="ALD Density function")




