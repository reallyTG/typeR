library(growfunctions)


### Name: gmrfdpgrow
### Title: Bayesian instrinsic Gaussian Markov Random Field model for
###   dependent time-indexed functions
### Aliases: gmrfdpgrow
### Keywords: model

### ** Examples

{
library(growfunctions)

## load the monthly employment count data for a collection of 
## U.S. states from the Current 
## Population Survey (cps)
data(cps)
## subselect the columns of N x T, y, associated 
## with the years 2008 - 2013
## to examine the state level employment levels 
## during the "great recession"
y_short   <- cps$y[,(cps$yr_label %in% c(2008:2013))]

## Run the DP mixture of iGMRF's to estimate posterior 
## distributions for model parameters
## Under default RW2(kappa) = order 2 trend 
## precision term
## Run for 1500 iterations, with half as burn-in for a
## more useful (converged) result.
res_gmrf            <- gmrfdpgrow(y = y_short, 
                                     n.iter = 40, 
                                     n.burn = 20, 
                                     n.thin = 1) 
                                     
## 2 plots of estimated functions: 1. faceted by cluster and fit;
## 2.  data for experimental units.
## for a group of randomly-selected functions
fit_plots_gmrf      <- cluster_plot( object = res_gmrf, 
                                     units_name = "state", 
                                     units_label = cps$st, 
                                     single_unit = FALSE, 
                                     credible = TRUE )    
}



