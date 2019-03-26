library(growfunctions)


### Name: growfunctions-package
### Title: Bayesian Non-Parametric Models for Estimating a Set of Denoised,
###   Latent Functions From an Observed Collection of Domain-Indexed
###   Time-Series
### Aliases: growfunctions-package growfunctions package-growfunctions
### Keywords: package

### ** Examples

{
library(growfunctions)

## load the monthly employment count 
## data for a collection of 
## U.S. states from the Current 
## Population Survey (cps)
data(cps)
## subselect the columns of N x T, y, 
## associated with 
## the years 2011 - 2013
## to examine the state level 
## employment levels 
## during the "great recession"
y_short <- cps$y[,(cps$yr_label %in% 
                  c(2011:2013))]

## run DP mixture of GP's to estimate 
## posterior distributions 
## for model parameters
## uses default setting of a single 
## "rational quadratic" 
## covariance formula
## A short number of iterations is used 
## for illustration
## Run for 500 iterations with half 
## as burn-in to 
## get a more useful result
res_gp     <- gpdpgrow(
                   y = y_short, 
                   n.iter = 3, 
                   n.burn = 1, 
                   n.thin = 1, 
                   n.tune = 0)  
## 2 plots of estimated functions: 
## 1. faceted by cluster and fit;
## 2.  data for experimental units.
## for a group of randomly-selected 
## functions
fit_plots_gp   <- cluster_plot( 
  object = res_gp, units_name = "state", 
  units_label = cps$st, single_unit = FALSE, 
  credible = TRUE )
                                   
## Run the DP mixture of iGMRF's 
## to estimate posterior 
## distributions for model parameters
## Under default RW2(kappa) = order 2 trend 
## precision term
## A short number of iterations 
## is used for illustration
## Run for 2000 iterations with 
## half as burn-in to 
## get a more useful result
res_gmrf <- gmrfdpgrow(
                 y = y_short, 
                 n.iter = 11, 
                 n.burn = 4, 
                 n.thin = 1) 
                                     
## 2 plots of estimated functions: 
## 1. faceted by cluster and fit;
## 2.  data for experimental units.
## for a group of 
## randomly-selected functions
fit_plots_gmrf <- cluster_plot( 
  object = res_gmrf, units_name = "state", 
  units_label = cps$st, single_unit = FALSE, 
  credible = TRUE )                                    
                                     
## visual comparison of fit performance 
## between gpdpgrow() and gmrfdpgrow()
## or any two objects returned from any
## combination of these estimation
## functions
objects        <- vector("list",2)
objects[[1]]   <- res_gmrf
objects[[2]]   <- res_gp
label.object   <- c("gmrf_tr2","gp_rq")
## the map data.frame 
## object from fit_plots gp 
## includes a field that 
## identifies cluster assignments
## for each unit (or domain)
H        <- fit_plots_gp$map$cluster
fit_plot_compare_facet <- 
fit_compare( objects = objects, 
 H = H, label.object = label.object,
 y.axis.label = "normalized y",
 units_name = "state", units_label = cps$st)                                
}




