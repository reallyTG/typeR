library(intubate)


### Name: ivfixed
### Title: Interfaces for ivfixed package for data science pipelines.
### Aliases: ntbt_ivFixed
### Keywords: intubate magrittr ivfixed ivFixed

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(ivfixed)
##D 
##D 
##D ## ntbt_ivFixed: Fit an Instrumental least square dummy variable model
##D pib <- as.matrix(c(12,3,4,0.4,0.7,5,0.7,0.3,
##D                    0.6,89,7,8,45,7,4,5,0.5,5),nrows=18,ncols=1)
##D tir <- as.matrix(c(12,0.3,4,0.4,7,12,3.0,6.0,45,
##D                    7.0,0.8,44,65,23,4,6,76,9),nrows=18,ncols=1)
##D inf <- as.matrix(c(1.2,3.6,44,1.4,0.78,54,0.34,0.66,
##D                    12,0.7,8.0,12,65,43,5,76,65,8),nrows=18,ncols=1)
##D npl <- as.matrix(c(0.2,3.8,14,2.4,1.7,43,0.2,0.5,23,
##D                    7.8,88,36,65,3,44,65,7,34),nrows=18,ncols=1)
##D mdata <- data.frame(p = pib, t = tir, int = inf, np = npl)
##D 
##D ## Original function to interface
##D ivFixed(t ~ p + int | p + np, mdata, n = 6, t = 3)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ivFixed(mdata, t ~ p + int | p + np, n = 6, t = 3)
##D 
##D ## so it can be used easily in a pipeline.
##D mdata %>%
##D   ntbt_ivFixed(t ~ p + int | p + np, n = 6, t = 3)
## End(Not run)



