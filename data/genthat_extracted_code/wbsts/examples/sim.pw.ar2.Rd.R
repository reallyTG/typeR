library(wbsts)


### Name: sim.pw.ar2
### Title: Simulation of a piecewise constant AR(2) model
### Aliases: sim.pw.ar2
### Keywords: piecewise AR(2)

### ** Examples
 
cps=c(512,754)
y=sim.pw.ar2(N =1024,sd_u = 1,b.slope=c(0.9,1.68,1.32),
b.slope2 = c(0.0,-0.81,-0.81),br.loc = cps)[[2]]
ts.plot(y)
abline(v=cps,col="red")




