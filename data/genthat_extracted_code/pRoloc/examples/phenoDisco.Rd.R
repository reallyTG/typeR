library(pRoloc)


### Name: phenoDisco
### Title: Runs the 'phenoDisco' algorithm.
### Aliases: phenoDisco

### ** Examples

## Not run: 
##D library(pRolocdata)
##D data(tan2009r1)
##D pdres <- phenoDisco(tan2009r1, fcol = "PLSDA")
##D getPredictions(pdres, fcol = "pd", scol = NULL)
##D plot2D(pdres, fcol = "pd")
##D 
##D ## to pre-process the data with t-SNE instead of PCA
##D pdres <- phenoDisco(tan2009r1, fcol = "PLSDA", dimred = "t-SNE")
## End(Not run)



