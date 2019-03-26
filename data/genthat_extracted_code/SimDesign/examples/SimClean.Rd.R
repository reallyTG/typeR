library(SimDesign)


### Name: SimClean
### Title: Removes/cleans files and folders that have been saved
### Aliases: SimClean

### ** Examples

## Not run: 
##D 
##D # remove file called 'results.rds'
##D SimClean('results.rds')
##D 
##D # remove default temp file
##D SimClean(temp = TRUE)
##D 
##D # remove default saved-data directory
##D SimClean(generate_data = TRUE)
##D 
##D # remove customized saved-results directory called 'mydir'
##D SimClean(results = TRUE, save_details = list(save_results_dirname = 'mydir'))
##D 
## End(Not run)



