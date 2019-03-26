library(rollmatch)


### Name: trimPool
### Title: Use a caliper to trim the comparison data to only observations
###   within threshold
### Aliases: trimPool
### Keywords: internal

### ** Examples

## Not run: 
##D  
##D load(url(paste0("https://github.com/RTIInternational/rollmatch/raw/master/",
##D                  "tests/testthat/lr_result.rda")))
##D load(url(paste0("https://github.com/RTIInternational/rollmatch/raw/master/",
##D                 "tests/testthat/comparison_pool.rda")))
##D trimmed_pool <- trimPool(alpha = .2, data_pool = comparison_pool,
##D                          lr_result = lr_result)
##D head(trimmed_poll)
## End(Not run)
                         



