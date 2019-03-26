library(growfunctions)


### Name: predict_functions.gmrfdpgrow
### Title: Use the model-estimated iGMRF precision parameters from
###   gmrfdpgrow() to predict the iGMRF function at future time points.
###   Inputs the 'gmrfdpgrow' object of estimated parameters.
### Aliases: predict_functions.gmrfdpgrow

### ** Examples

## Not run: 
##D library(growfunctions)
##D data(cps)
##D y_short   <- cps$y[,(cps$yr_label %in% c(2010:2013))]
##D t_train   <- ncol(y_short)
##D N         <- nrow(y_short)
##D t_test    <- 4
##D  
##D ## Model Runs
##D 
##D res_gmrf            = gmrfdpgrow(y = y_short, 
##D                                 q_order = c(2,4), 
##D                                 q_type = c("tr","sn"), 
##D                                 n.iter = 100, 
##D                                 n.burn = 50, 
##D                                 n.thin = 1) 
##D ## Prediction Model Runs
##D T_test             <- 4
##D 
##D pred_gmrf          <- predict_functions( object = res_gmrf,
##D                                      J = 1000, 
##D                                      T_test = T_test )
##D 
##D ## plot estimated and predicted functions
##D plot_gmrf       <- predict_plot(object = pred_gmrf, 
##D                                units_label = cps$st, 
##D                                single_unit = TRUE, 
##D                                credible = FALSE)
## End(Not run)



