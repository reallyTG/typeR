library(TSCS)


### Name: plot_map
### Title: Visualize Spatial(Cross-Section) Data of a Given Time Point - 2D
###   Map
### Aliases: plot_map

### ** Examples

## Not run: 
##D 
##D ## TSCS spatial interpolation procedure:
##D 
##D basis <- tscsRegression(data = data, h = 1, v = 1, alpha = 0.01); # regression
##D basis$percentage # see the percentage of cointegrated relationships
##D est <- tscsEstimate(matrix = basis$coef_matrix, newdata = newdata, h = 1, v = 1); # estimation
##D str(est)
##D 
##D ## comparison of estimates and true values:
##D 
##D plot_compare(est = est$estimate[,3], true = true) # graphic comparison
##D index <- appraisal_index(est = est$estimate[,3], true = true); # RMSE & std
##D index
##D 
##D ## data visualization:
##D 
##D plot_dif(data = data[,1:2], h = 1, v = 1) # differentiate boundary and interior spatial locations
##D plot_NA(newdata = newdata) # show spatial locations with missing value, for a cross-section data
##D plot_map(newdata = newdata) # plot the 2D spatial map, for a cross-section data
## End(Not run)



