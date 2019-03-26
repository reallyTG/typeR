library(episheet)


### Name: risk
### Title: Calculate risk ratio and risk difference
### Aliases: risk

### ** Examples

# Data from stratum 1 of table 15-1., p260
dat <- data.frame(
    exposure_var = c(rep(1, 8), rep(0, 5), rep(1, 98), rep(0, 115)),
  outcome_var = c(rep(1, 8), rep(1, 5), rep(0, 98), rep(0, 115)),
  stringsAsFactors = FALSE
)
risk(data = dat, exposure = exposure_var, outcome = outcome_var)



