library(growfunctions)


### Name: gpdpgrow
### Title: Bayesian non-parametric dependent Gaussian process model for
###   time-indexed functional data
### Aliases: gpdpgrow
### Keywords: model

### ** Examples

{
library(growfunctions)

## load the monthly employment count data for a collection of 
## U.S. states from the Current 
## Population Survey (cps)
data(cps)
## subselect the columns of N x T, y, associated with 
## the years 2011 - 2013
## to examine the state level employment 
## levels during the "great recession"
y_short   <- cps$y[,(cps$yr_label %in% c(2011:2013))]

## uses default setting of a single "rational quadratic" covariance
## run for 500 iterations, with half discarded as burn-in to 
## obtain a more useful result.
res_gp               <- gpdpgrow(y = y_short, 
                                 n.iter = 4, 
                                 n.burn = 1, 
                                 n.thin = 1, 
                                 n.tune = 0)  

## Two plots of estimated functions, 
## 1. faceted by cluster 
## 2. fitted functions vs noisy observations
## first plot will plot estimated denoised function, 
## bb_i, for a single (randomly-selected) "state"
fit_plots_gp        <- cluster_plot( object = res_gp,  
                           units_name = "state", 
                           units_label = cps$st, 
                           single_unit = TRUE, 
                           credible = TRUE )
## second plot will randomly select 6 states 
## and plot their estimated denoised functions, bb_i.
## with setting "single_unit = FALSE". 
## (Option "num_plot" may be set to plot 
## any integer number of 
## randomly-selected units.)
fit_plots_gp        <- cluster_plot( object = res_gp,  
                                     units_name = "state", 
                                     units_label = cps$st, 
                                     single_unit = FALSE, 
                                     credible = TRUE )

}



