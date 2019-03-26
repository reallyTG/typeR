library(mgm)


### Name: resample
### Title: Resampling scheme for mgm objects
### Aliases: resample

### ** Examples


## Not run: 
##D 
##D 
##D # 1) Fit mgm to example dataset (true edges: 1-4, 2-3, 1-2)
##D mgm_obj <- mgm(data = mgm_data$data, 
##D                type = c('g', 'c', 'c', 'g'),
##D                level = c(1, 2, 4, 1),
##D                k = 2, 
##D                lambdaSel = 'CV', 
##D                threshold = 'none')
##D 
##D # 2) Take 50 bootstrap samples using resample()
##D res_obj <- resample(object = mgm_obj, 
##D                     data = mgm_data$data,
##D                     nB = 50)
##D 
##D # 3) Plot histogram of bootstrapped sampling distribution of edge 1-4
##D hist(res_obj$bootParameters[1, 4, ], 
##D      main = "", 
##D      xlab = "Parameter Estimate")
##D 
##D # 4) Plot summary of all sampling distributions
##D plotRes(object = res_obj, 
##D         quantiles = c(0.05, .95))
##D 
##D 
##D # For more examples see https://github.com/jmbh/mgmDocumentation
##D 
##D 
##D 
## End(Not run)





