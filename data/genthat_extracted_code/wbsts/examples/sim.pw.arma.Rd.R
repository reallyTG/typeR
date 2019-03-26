library(wbsts)


### Name: sim.pw.arma
### Title: Simulation of a piecewise constant ARMA(p,q) model for p=2 and
###   q=1
### Aliases: sim.pw.arma
### Keywords: piecewise ARMA

### ** Examples
 
cps=c(125,532,704)
y=sim.pw.arma(N = 1024,sd_u = 1,b.slope=c(0.7,0.3,0.9,0.1),
b.slope2 = c(0,0,0,0), mac = c(0.6,0.3,0,-0.5),br.loc = cps)[[2]]
ts.plot(y)
abline(v=cps,col="red")                    



