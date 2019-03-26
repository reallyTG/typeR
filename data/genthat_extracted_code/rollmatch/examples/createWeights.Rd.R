library(rollmatch)


### Name: createWeights
### Title: Create control weights for matches dataset, and final data
###   output As it's an internal helper function to aid in testing, it is
###   not exported for use outside of the package.
### Aliases: createWeights
### Keywords: internal

### ** Examples

## Not run: 
##D  
##D id <- "indiv_id"
##D data(package="rollmatch", "rem_synthdata")
##D load(url(paste0("https://github.com/RTIInternational/rollmatch/raw/master/",
##D                 "tests/testthat/matches.rda")))
##D data <- rem_synthdata
##D matches <- addMatchesColumns(matches)
##D out_list <- createWeights(matches, data, id)
##D head(a)
## End(Not run)




