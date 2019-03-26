library(automap)


### Name: autoKrige
### Title: Performs an automatic interpolation
### Aliases: autoKrige

### ** Examples

# Data preparation
## Not run: 
##D data(meuse)
##D coordinates(meuse) =~ x+y
##D data(meuse.grid)
##D gridded(meuse.grid) =~ x+y
##D 
##D # Ordinary kriging, no new_data object
##D kriging_result = autoKrige(zinc~1, meuse)
##D plot(kriging_result)
##D 
##D # Ordinary kriging
##D kriging_result = autoKrige(zinc~1, meuse, meuse.grid)
##D plot(kriging_result)
##D 
##D # Fixing the nugget to 0.2
##D kriging_result = autoKrige(zinc~1, meuse, 
##D 	meuse.grid, fix.values = c(0.2,NA,NA))
##D plot(kriging_result)
##D 
##D # Universal kriging
##D kriging_result = autoKrige(zinc~soil+ffreq+dist, meuse, meuse.grid)
##D plot(kriging_result)
##D 
##D # Block kriging  
##D kriging_result_block = autoKrige(zinc~soil+ffreq+dist, 
##D 	meuse, meuse.grid, block = c(400,400))
##D plot(kriging_result_block)
##D 
##D # Dealing with duplicate observations
##D data(meuse)
##D meuse.dup = rbind(meuse, meuse[1,]) # Create duplicate
##D coordinates(meuse.dup) = ~x+y
##D kr = autoKrige(zinc~dist, meuse.dup, meuse.grid)
##D 
##D # Extracting parts from the autoKrige object
##D prediction_spdf = kr$krige_output
##D sample_variogram = kr$exp_var
##D variogram_model = kr$var_model
## End(Not run)



