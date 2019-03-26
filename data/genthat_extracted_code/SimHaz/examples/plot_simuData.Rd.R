library(SimHaz)


### Name: plot_simuData
### Title: Make an incidence plot from simulated data.
### Aliases: plot_simuData
### Keywords: Plot

### ** Examples

dat <- tdSim.method2(500, duration=24,lambda12=1.3,lambda23=0.04, 
    lambda13=0.03, exp.prop=0.2,rateC=0.05, min.futime=4, min.postexp.futime=4)
	
plot_simuData(dat, title='method2_filter')



