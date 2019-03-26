library(SimHaz)


### Name: tdSim.clst
### Title: Simulate 1 dataframe (1 simulation) of time-dependent exposure
###   under method 1 with a clustering data frame
### Aliases: tdSim.clst
### Keywords: Simulation

### ** Examples

# Create a clustering data frame as input with 3 categories and a 20% weighted
# exposure proportion.
  
input_df <- data.frame(cat_id = c('lo', 'med', 'hi'), 
	cat_prop = c(0.65, 0.2, 0.15), cat_exp.prop = c(0.1, 0.3, 0.5))

# Simulate a dataset of 600 subjects with time-dependent exposure. Consider
# both minimum follow-up time (4 months) and minimum post-exposure follow-up
# time (4 months). Also consider a quick exposure after entering the study for
# each exposed subject. Set the maximum relative exposure time to be 1/6. 

# Set the duration of the study to be 24 months; the median time to event for
# control group to be 24 months; exposure effect to be 0.3; median time to
# censoring to be 14 months.

df_tdclst <- tdSim.clst(N = 600, duration = 24, lambda = log(2)/24, rho = 1,
    beta = 0.3, rateC = log(2)/14, df = input_df, prop.fullexp = 0,
    maxrelexptime = 1/6, min.futime = 4, min.postexp.futime = 4)



