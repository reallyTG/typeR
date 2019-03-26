library(smfsb)


### Name: simpleEuler
### Title: Simulate a sample path from an ODE model
### Aliases: simpleEuler
### Keywords: smfsb

### ** Examples

# simple Lotka-Volterra example
lv <- function(x,t,k=c(k1=1,k2=0.1,k3=0.1))
{
        with(as.list(c(x,k)),{
                c( k1*x1 - k2*x1*x2 ,
                      k2*x1*x2 - k3*x2 )
        })
}
plot(simpleEuler(t=100,fun=lv,ic=c(x1=4,x2=10)),plot.type="single",lty=1:2)

# now an example which instead uses deSolve...
require(deSolve)
times = seq(0,50,by=0.01)
k = c(k1=1,k2=0.1,k3=0.1)
lvlist = function(t,x,k)
        list(lv(x,t,k))
plot(ode(y=c(x1=4,x2=10),times=times,func=lvlist,parms=k))




