library(ICEbox)


### Name: plot.ice
### Title: Plotting of 'ice' objects.
### Aliases: plot.ice

### ** Examples

## Not run: 
##D require(ICEbox)
##D require(randomForest)
##D require(MASS) #has Boston Housing data, Pima
##D 
##D data(Boston) #Boston Housing data
##D X = Boston
##D y = X$medv
##D X$medv = NULL
##D 
##D ## build a RF:
##D bhd_rf_mod = randomForest(X, y)
##D 
##D ## Create an 'ice' object for the predictor "age":
##D bhd.ice = ice(object = bhd_rf_mod, X = X, y = y, predictor = "age",
##D             frac_to_build = .1) 
##D 
##D ## plot
##D plot(bhd.ice, x_quantile = TRUE, plot_pdp = TRUE, frac_to_plot = 1) 
##D 
##D ## centered plot
##D plot(bhd.ice, x_quantile = TRUE, plot_pdp = TRUE, frac_to_plot = 1, 
##D 		centered = TRUE) 
##D 
##D ## color the curves by high and low values of 'rm'.
##D # First create an indicator variable which is 1 if the number of 
##D # rooms is greater than the median:
##D median_rm = median(X$rm)
##D bhd.ice$Xice$I_rm = ifelse(bhd.ice$Xice$rm > median_rm, 1, 0)  
##D 
##D plot(bhd.ice, frac_to_plot = 1, centered = TRUE, prop_range_y = TRUE,  
##D             x_quantile = T, plot_orig_pts_preds = T, color_by = "I_rm")
##D bhd.ice = ice(object = bhd_rf_mod, X = X, y = y, predictor = "age",
##D             frac_to_build = 1)             
##D plot(bhd.ice, frac_to_plot = 1, centered = TRUE, prop_range_y = TRUE,  
##D             x_quantile = T, plot_orig_pts_preds = T, color_by = y)            
## End(Not run)



