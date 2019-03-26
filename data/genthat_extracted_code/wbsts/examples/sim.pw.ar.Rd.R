library(wbsts)


### Name: sim.pw.ar
### Title: Simulation of a piecewise constant AR(1) model
### Aliases: sim.pw.ar
### Keywords: piecewise AR(1)

### ** Examples

cps=c(400,612)
y=sim.pw.ar(N =1024,sd_u = 1,b.slope=c(0.4,-0.6,0.5),br.loc=cps)[[2]]
ts.plot(y)
abline(v=cps,col="red")




