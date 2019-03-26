library(SimHaz)


### Name: getpower.clst
### Title: Calculate power for the Cox proportional hazard model with
###   time-dependent exposure using method 1 with clustering
### Aliases: getpower.clst
### Keywords: Power_Calculation

### ** Examples

# Install the survival package if needed.

library(survival)

# Create a clustering data frame as input with 3 categories and a 20% weighted
# exposure proportion.
  
input_df <- data.frame(cat_id = c('lo', 'med', 'hi'),
	cat_prop = c(0.65, 0.2, 0.15), cat_exp.prop = c(0.1, 0.3, 0.5))

# We recommend setting nSim to at least 500. It is set to 10 in the example to
# reduce run time for CRAN submission.

# Run 10 simulations. Each time simulate a dataset of 600 subjects with
# time-dependent exposure with both minimum follow-up time (4 months) and
# minimum post-exposure follow-up time (4 months) imposed. Also consider a
# quick exposure after entering the study for each exposed subject. Set the
# maximum relative exposure time to be 1/6. 

# Set the duration of the study to be 24 months; the median time to event for
# control group to be 24 months; exposure effect to be 0.3; median time to
# censoring to be 14 months.

ret <- getpower.clst(nSim = 10, N = 600, beta = 0.3, df = input_df,
    type = "td", scenario = "clustering", maxrelexptime = 1/6, min.futime = 4,
    min.postexp.futime = 4, output.fn = "output_clst.csv",) 



