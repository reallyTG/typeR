library(MPS)


### Name: expgg
### Title: exponentiated generalized G distribution
### Aliases: dexpgg pexpgg qexpgg rexpgg mpsexpgg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dexpgg(x, "weibull", c(1,1,2,2,3))
pexpgg(x, "weibull", c(1,1,2,2,3))
qexpgg(runif(100), "weibull", c(1,1,2,2,3))
rexpgg(100, "weibull", c(1,1,2,2,3))
mpsexpgg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



