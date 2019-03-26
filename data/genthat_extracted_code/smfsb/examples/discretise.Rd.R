library(smfsb)


### Name: discretise
### Title: Discretise output from a discrete event simulation algorithm
### Aliases: discretise
### Keywords: smfsb

### ** Examples

# load LV model
data(spnModels)
# simulate a realisation of the process and plot it
out = gillespie(LV,10000)
op=par(mfrow=c(2,2))
plot(stepfun(out$t,out$x[,1]),pch="")
plot(stepfun(out$t,out$x[,2]),pch="")
plot(out$x,type="l")

# use the "discretise" function to map it to an R "ts" object
plot(discretise(out,dt=0.01),plot.type="single",lty=c(1,2))
par(op)



