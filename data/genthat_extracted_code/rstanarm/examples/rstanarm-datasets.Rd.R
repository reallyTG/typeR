library(rstanarm)


### Name: rstanarm-datasets
### Title: Datasets for rstanarm examples
### Aliases: rstanarm-datasets kidiq roaches wells bball1970 bball2006
###   mortality tumors radon pbcLong pbcSurv

### ** Examples

# Using 'kidiq' dataset 
fit <- stan_lm(kid_score ~ mom_hs * mom_iq, data = kidiq, 
               prior = R2(location = 0.30, what = "mean"),
               # the next line is only to make the example go fast enough
               chains = 1, iter = 500, seed = 12345)
pp_check(fit, nreps = 20)
## No test: 
bayesplot::color_scheme_set("brightblue")
pp_check(fit, plotfun = "stat_grouped", stat = "median", 
         group = factor(kidiq$mom_hs, labels = c("No HS", "HS")))
## End(No test)




