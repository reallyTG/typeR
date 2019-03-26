library(TSCS)


### Name: plot3D_map
### Title: Visualize Spatial(Cross-Section) Data of a Given Time Point - 3D
###   Map
### Aliases: plot3D_map

### ** Examples

## Not run: 
##D 
##D ## TSCS spatial interpolation procedure:
##D 
##D basis <- tscsRegression3D(data = data, h1 = 3.75, h2 = 2.5, v = 5, alpha = 0.01);
##D basis$percentage
##D est <- tscsEstimate3D(matrix = basis$coef_matrix, newdata = newdata, h1 = 3.75, h2 = 2.5, v = 5);
##D str(est)
##D 
##D ## comparison of estimates and true values:
##D 
##D plot_compare(est = est$estimate[,4], true = true)
##D index <- appraisal_index(est = est$estimate[,4], true = true);
##D index
##D 
##D ## data visualization:
##D 
##D plot3D_dif(data = data[,1:3], h1 = 3.75, h2 = 2.5, v = 5)
##D plot3D_NA(newdata = newdata)
##D plot3D_map(newdata = newdata)
## End(Not run)



