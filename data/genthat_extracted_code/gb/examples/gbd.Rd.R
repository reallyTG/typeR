library(gb)


### Name: degld
### Title: Basic functions for RS-GLD
### Aliases: degld pegld qegld regld egld gbd
### Keywords: stats

### ** Examples


lambdas = c(2,4,3,4)
shape=3;scale=4
x0 = rbeta(5,shape,scale)
x1 = x0*lambdas[2]+lambdas[1]
qegld(c(0,.1,.5,.7,1),lambdas)
qbeta(c(0,.1,.5,.7,1),shape,scale)*lambdas[2]+lambdas[1]

pegld(x1,lambdas)
pbeta(x0,shape,scale)

degld(x1,lambdas)
dbeta(x0,shape,scale)/lambdas[2]

x0 = sort(rbeta(1000,shape,scale))
y = x0*lambdas[2]+lambdas[1]
plot(dbeta(x0,shape,scale)/lambdas[2]~y,type='l')
lines(degld(y,lambdas)~y,lty=2,col=2)
lines(density(y),col=4,lty=3)




