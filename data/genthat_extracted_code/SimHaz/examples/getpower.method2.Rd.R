library(SimHaz)


### Name: getpower.method2
### Title: Calculate power for the Cox proportional hazard model with
###   time-dependent exposure using method 2
### Aliases: getpower.method2
### Keywords: Power_Calculation

### ** Examples

# We recommend setting nSim to at least 500. It is set to 10 in the example to
# reduce run time for CRAN submission.

# Run 10 simulations. Each time simulate a dataset of 600 subjects

ret <- getpower.method2(nSim=10, N=600, duration=24, scenario="test",
  lambda12=1.3, lambda23=0.04, lambda13=0.03, HR=NULL,exp.prop=0.2, rateC=0.05,
  min.futime=4, min.postexp.futime=4,output.fn="database.csv", simu.plot=FALSE) 



