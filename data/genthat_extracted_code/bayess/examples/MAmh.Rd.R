library(bayess)


### Name: MAmh
### Title: Metropolis-Hastings evaluation of the posterior associated with
###   an MA(p) model
### Aliases: MAmh
### Keywords: auto-regressive model lag-polynomial complex roots

### ** Examples

data(Eurostoxx50)
x=Eurostoxx50[1:350, 5]
resMA5=MAmh(x=x,p=5,W=50)
plot(resMA5$mus,type="l",col="steelblue4",xlab="Iterations",ylab=expression(mu))



