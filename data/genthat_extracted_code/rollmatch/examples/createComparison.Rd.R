library(rollmatch)


### Name: createComparison
### Title: Create a dataframe of comparisons between all treatment and
###   control data. As it's an internal helper function to aid in testing,
###   it is not exported for use outside of the package.
### Aliases: createComparison
### Keywords: internal

### ** Examples

## Not run: 
##D  
##D load(url(paste0("https://github.com/RTIInternational/rollmatch/raw/master/",
##D                  "tests/testthat/lr_result.rda")))
##D tm <- "quarter"; entry <- "entry_q"; id <- "indiv_id"
##D comparison_pool <- createComparison(lr_result, tm, entry, id)
##D head(comparison_pool)
## End(Not run)




