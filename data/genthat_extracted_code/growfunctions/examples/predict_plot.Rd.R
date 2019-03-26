library(growfunctions)


### Name: predict_plot
### Title: Plot estimated functions both at estimated and predicted time
###   points with 95% credible intervals.
### Aliases: predict_plot

### ** Examples

## Not run: 
##D library(growfunctions)
##D data(cps)
##D y_short             <- cps$y[,(cps$yr_label %in% c(2008:2013))]
##D t_train             <- ncol(y_short)
##D N                   <- nrow(y_short)
##D t_test              <- 4
##D  
##D ## Model Runs
##D 
##D res_gmrf            <- gmrfdpgrow(y = y_short, 
##D                                 q_order = c(2,4), 
##D                                 q_type = c("tr","sn"), 
##D                                 n.iter = 40, 
##D                                 n.burn = 20, 
##D                                 n.thin = 1) 
##D 
##D res_gp              <- gpdpgrow(y = y_short
##D                               n.iter = 10, 
##D                               n.burn = 4, 
##D                               n.thin = 1, 
##D                               n.tune = 0) 
##D 
##D ## Prediction Model Runs
##D T_test             <- 4
##D 
##D pred_gmrf          <- predict_functions( object = res_gmrf,
##D                                      J = 1000, 
##D                                      T_test = T_test )
##D 
##D T_yshort           <- ncol(y_short)
##D pred_gp            <- predict_functions( object = res_gp, 
##D                      test_times = (T_yshort+1):(T_yshort+T_test) )
##D 
##D ## plot estimated and predicted functions
##D plot_gmrf       <- predict_plot(object = pred_gmrf, 
##D                                units_label = cps$st, 
##D                                single_unit = TRUE, 
##D                                credible = FALSE)
##D 
##D plot_gp         <- predict_plot(object = pred_gp, 
##D                                units_label = cps$st, 
##D                                single_unit = FALSE, 
##D                                credible = TRUE)  
## End(Not run)



