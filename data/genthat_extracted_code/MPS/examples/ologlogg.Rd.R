library(MPS)


### Name: ologlogg
### Title: odd log-logistic G distribution
### Aliases: dologlogg pologlogg qologlogg rologlogg mpsologlogg

### ** Examples

x<-rweibull(100,shape=2,scale=2)+3
dologlogg(x, "weibull", c(1,1,1,2,2,3))
pologlogg(x, "weibull", c(1,1,1,2,2,3))
qologlogg(runif(100), "weibull", c(1,1,1,2,2,3))
rologlogg(100, "weibull", c(1,1,1,2,2,3))
mpsologlogg(x, "weibull", TRUE, "Nelder-Mead", 0.05)



