library(eesim)


### Name: power_calc
### Title: Power Calculations
### Aliases: power_calc

### ** Examples


# Calculate power for studies that vary in the total length of the study period
# (between one and twenty-one years of data) for the association between a continuous
# exposure with a seasonal trend (mean = 100, sd from seasonal baseline = 10) and a count
# outcome (e.g., daily number of deaths, mean daily value across the study period of 22).
# The alternative hypothesis is that there is a relative rate of the outcome of 1.001 for
# every one-unit increase in exposure. The null hypothesis is that there is no association
# between the exposure and the outcome. The model used to test for an association is a
# case-crossover model
## Not run: 
##D pow <- power_calc(varying = "n", values = floor(365.25 * seq(1, 21, by = 5)), n_reps = 20,
##D            central = 100, sd = 10, rr = 1.001, exposure_type = "continuous",
##D            exposure_trend = "cos1", exposure_amp = .6, average_outcome = 22,
##D            outcome_trend = "no trend", outcome_amp = .6,
##D            custom_model = spline_mod, plot = TRUE)
## End(Not run)




