library(LongMemoryTS)


### Name: VARFIMA.sim
### Title: Simulation of a VARFIMA(1,1) in final equations form.
### Aliases: VARFIMA.sim

### ** Examples

series<-VARFIMA.sim(phi=0.4, THETA=matrix(c(0,0,0,0),2,2), 
d.vec=c(0.4,0.3), T=1000, Sigma=matrix(c(1,0.4,0.4,1),2,2))
ts.plot(series, col=1:2)
acf(series, lag=100)



