library(SimHaz)


### Name: getpower.method1
### Title: Calculate power for the Cox proportional hazard model with
###   time-dependent exposure using method 1
### Aliases: getpower.method1
### Keywords: Power_Calculation

### ** Examples

# Install the survival package if needed.

library(survival)

# We recommend setting nSim to at least 500. It is set to 10 in the example to
# reduce run time for CRAN submission.

# Run 10 simulations. Each time simulate a dataset of 600 subjects with
# time-dependent exposure with both minimum follow-up time (4 months) and
# minimum post-exposure follow-up time (4 months) imposed. Also consider a
# quick exposure after entering the study for each exposed subject. Set the
# maximum relative exposure time to be 1/6. 

# Set the duration of the study to be 24 months; the median time to event for
# control group to be 24 months; exposure effect to be 0.3; median time to
# censoring to be 14 months; and exposure proportion to be 20%.


ret <- getpower.method1(nSim = 10, N = 600, b = 0.3, exp.prop = 0.2,
    type = "td", scenario = " ", maxrelexptime = 1/6, min.futime = 4,
    min.postexp.futime = 4, output.fn = "output.csv")




