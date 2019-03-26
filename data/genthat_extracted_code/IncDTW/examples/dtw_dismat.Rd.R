library(IncDTW)


### Name: dtw_dismat
### Title: DTW Distance Matrix
### Aliases: dtw_dismat dtw_disvec
### Keywords: classif cluster ts

### ** Examples

lot <- lapply(1:10, function(i){matrix(rnorm(100), ncol=2)})

## Not run: 
##D # per default all minus 1 available cores are used
##D result <- dtw_dismat(lot = lot, dist_method = "norm2", ws = 20, 
##D                   return_matrix = FALSE)
## End(Not run)

# for few time series you can set ncores=0 for NON-parallel computation
result <- dtw_dismat(lot = lot, dist_method = "norm2", ws = 20, 
                  return_matrix = FALSE, ncores = 1)




