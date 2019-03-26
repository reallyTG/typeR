library(DCA)


### Name: la.simu.gen
### Title: Simulate a data matrix with underlying dynamic correlation
###   signal in the Liquid Association (LA) framework
### Aliases: la.simu.gen

### ** Examples

x<-la.simu.gen(n=100,p=200,n.grp=3, n.noise.gene=100, rho=0.5, pwr=1)
x$dat[1:5,1:5]
x$z[1:5,]



