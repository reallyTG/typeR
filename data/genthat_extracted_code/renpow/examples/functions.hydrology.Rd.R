library(renpow)


### Name: Hydro Power Hydrology
### Title: Hydro Power Hydrology functions
### Aliases: hydrology area.vol model.flow flow.plot flow.exc.plot exceed
###   annual.avg
### Keywords: hplot dplot math

### ** Examples


x <- list(H=130,B=100,W=10,L=100)
area.vol(x)

x <- list(base.flow=20,peak.flow=100,day.peak=200,length.season=90,
          variab=c(0.01,2),coef=c(0.4,0.3,0.2,0.1))
flow <- model.flow(x)
flow.plot(flow,label="Simulated flow (m3/s)")
exc <- exceed(flow)
exc$prob.Q
flow.exc.plot(flow,exc,label="Simulated flow (m3/s)")




