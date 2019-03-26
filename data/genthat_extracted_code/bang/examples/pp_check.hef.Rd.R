library(bang)


### Name: pp_check.hef
### Title: Posterior predictive checks for a hef object
### Aliases: pp_check.hef pp_check

### ** Examples

############################ Beta-binomial #################################

# ------------------------- Rat tumor data ------------------------------- #

rat_res <- hef(model = "beta_binom", data = rat, nrep = 50)

# Overlaid density estimates
pp_check(rat_res)
## Not run: 
##D # Overlaid distribution function estimates
##D pp_check(rat_res, fun = "ecdf_overlay")
## End(Not run)
# Multiple histograms
pp_check(rat_res, fun = "hist", nrep = 8)
## Not run: 
##D # Multiple boxplots
##D pp_check(rat_res, fun = "boxplot")
##D # Predictive medians vs observed median
##D pp_check(rat_res, fun = "stat", stat = "median")
## End(Not run)
# Predictive (mean, sd) vs observed (mean, sd)
pp_check(rat_res, fun = "stat_2d", stat = c("mean", "sd"))

############################ Gamma-Poisson #################################

# ------------------------ Pump failure data ------------------------------ #

pump_res <- hef(model = "gamma_pois", data = pump, nrep = 50)

## Not run: 
##D # Overlaid density estimates
##D pp_check(pump_res)
##D # Predictive (mean, sd) vs observed (mean, sd)
##D pp_check(pump_res, fun = "stat_2d", stat = c("mean", "sd"))
## End(Not run)

###################### One-way Hierarchical ANOVA ##########################

#----------------- Late 21st Century Global Temperature Data ------------- #

RCP26_2 <- temp2[temp2$RCP == "rcp26", ]
temp_res <- hanova1(resp = RCP26_2[, 1], fac = RCP26_2[, 2], nrep = 50)
## Not run: 
##D # Overlaid density estimates
##D pp_check(temp_res)
##D # Predictive (mean, sd) vs observed (mean, sd)
##D pp_check(temp_res, fun = "stat_2d", stat = c("mean", "sd"))
## End(Not run)



