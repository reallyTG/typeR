library(bayess)


### Name: ARmh
### Title: Metropolis-Hastings evaluation of the posterior associated with
###   an AR(p) model
### Aliases: ARmh
### Keywords: auto-regressive model lag-polynomial complex roots

### ** Examples

data(Eurostoxx50)
x=Eurostoxx50[, 4]
resAR5=ARmh(x=x,p=5,W=50)
plot(resAR5$mus,type="l",col="steelblue4",xlab="Iterations",ylab=expression(mu))



