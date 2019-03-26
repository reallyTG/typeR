library(mgm)


### Name: plotRes
### Title: Plot summary of resampled sampling distributions
### Aliases: plotRes

### ** Examples


## Not run: 
##D 
##D # Fit initial model
##D fit_aut <- mgm(data = as.matrix(autism_data$data),
##D                type = autism_data$type,
##D                level = autism_data$lev,
##D                k = 2)
##D 
##D 
##D # Fit bootstrapped models
##D res_aut <- resample(object = fit_aut, 
##D                     data = as.matrix(autism_data$data), 
##D                     nB = 10) # should be more in real applications 
##D 
##D # Plot Summary
##D plotRes(object = res_aut,
##D         quantiles = c(.05, .95), 
##D         labels = NULL, 
##D         axis.ticks = c(-.25, 0, .25, .5, .75))
##D 
##D   
## End(Not run)



