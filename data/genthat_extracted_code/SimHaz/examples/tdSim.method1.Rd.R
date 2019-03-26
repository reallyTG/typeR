library(SimHaz)


### Name: tdSim.method1
### Title: Simulate 1 dataframe (1 simulation) of time-dep exposure under
###   method 1
### Aliases: tdSim.method1
### Keywords: Simulation

### ** Examples

# Simulate a dataset of 600 subjects with time-dependent exposure without
# considering minimum follow-up time or minimum post-exposure follow-up time.
# Specifically, set the duration of the study to be 24 months; the median time to
# event for control group to be 24 months; exposure effect to be 0.3; median time
# to censoring to be 14 months; and exposure proportion to be 20%.

df1 <- tdSim.method1(N = 600, duration = 24, lambda = log(2)/24, rho = 1, 
   beta = 0.3, rateC = log(2)/14, exp.prop = 0.2, prop.fullexp  = 0, 
   maxrelexptime = 1, min.fut = 0, min.postexp.fut = 0)

# Simulate a dataset of 600 subjects with time-dependent exposure with
# both minimum follow-up time (4 months) and minimum post-exposure
# follow-up time (4 months) imposed. Other parameters remain the same as
# in the first case.

df2 <- tdSim.method1(N = 600, duration = 24, lambda = log(2)/24, rho = 1, 
   beta = 0.3, rateC = log(2)/14, exp.prop = 0.2, prop.fullexp  = 0, 
   maxrelexptime = 1, min.fut = 4, min.postexp.fut = 4)

# Simulate a dataset of 600 subjects with time-dependent exposure with
# both minimum follow-up time (4 months) and minimum post-exposure
# follow-up time (4 months) imposed. Also consider a quick exposure after
# entering the study for each exposed subject. Set the maximum relative
# exposure time to be 1/6. Other parameters remain the same as in the first case.

df3 <- tdSim.method1(N = 600, duration = 24, lambda = log(2)/24, rho = 1, 
   beta = 0.3, rateC = log(2)/14, exp.prop = 0.2, prop.fullexp  = 0,
   maxrelexptime = 1/6, min.fut = 4,min.postexp.fut = 4)



