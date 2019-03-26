library(growfunctions)


### Name: predict_functions.gpdpgrow
### Title: Use the model-estimated GP covariance parameters from gpdpgrow()
###   to predict the GP function at future time points.  Inputs the
###   'gpdpgrow' object of estimated parameters.
### Aliases: predict_functions.gpdpgrow

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
##D res_gp              = gpdpgrow(y = y_short
##D                               n.iter = 50, 
##D                               n.burn = 25, 
##D                               n.thin = 1, 
##D                               n.tune = 0) 
##D 
##D ## Prediction Model Runs
##D T_test             <- 4
##D T_yshort           <- ncol(y_short)
##D pred_gp            <- predict_functions( object = res_gp, 
##D                        test_times = (T_yshort+1):(T_yshort+T_test) )
##D 
##D ## plot estimated and predicted functions
##D plot_gp         <- predict_plot(object = pred_gp, 
##D                                units_label = cps$st, 
##D                                single_unit = FALSE, 
##D                                credible = TRUE)  
## End(Not run)



