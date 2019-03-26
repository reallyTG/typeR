library(GPLTR)


### Name: tree2indicators
### Title: From a tree to indicators (or dummy variables)
### Aliases: tree2indicators
### Keywords: documentation

### ** Examples

## Not run: 
##D ## load the data set
##D 
##D data(data_pltr)
##D 
##D ## set the parameters
##D 
##D args.rpart <- list(minbucket = 40, xval = 10, cp = 0)
##D family <- "binomial"
##D Y.name <- "Y"
##D X.names <- "G1"
##D G.names <- paste("G", 2:15, sep="")
##D 
##D ## build a maximal tree
##D 
##D fit_pltr <- pltr.glm(data_pltr, Y.name, X.names, G.names, args.rpart = args.rpart,
##D                      family = family,iterMax = 5, iterMin = 3)
##D 
##D ## Compute a list of indicator from the leaves of the tree fitted tree
##D 
##D tree2indicators(fit_pltr$tree)
## End(Not run)



