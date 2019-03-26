library(scaleboot)


### Name: relltest
### Title: RELL Test for Phylogenetic Inference
### Aliases: relltest summary.relltest
### Keywords: nonparametric

### ** Examples


## Not run: 
##D ## a quick example
##D data(mam15) # loading mam15.mt
##D mam15.trees <- relltest(mam15.mt,nb=1000) # nb=10000 is default
##D mam15.trees # SH-test p-values and result of fitting
##D summary(mam15.trees) # AU p-values
## End(Not run)

## Not run: 
##D ## An example from data(mam15).
##D ## It may take 20 mins to run relltest below.
##D mam15.mt <- read.mt("mam15.mt") # site-wise log-likelihoods
##D mam15.trees <- relltest(mam15.mt) # resampling and fitting
##D summary(mam15.trees) # AU p-values
## End(Not run)




