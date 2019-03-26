library(GPLTR)


### Name: nested.trees
### Title: compute the nested trees
### Aliases: nested.trees
### Keywords: documentation

### ** Examples

## Not run: 
##D ## load the data set
##D 
##D data(data_pltr)
##D args.rpart <- list(minbucket = 40, maxdepth = 10, cp = 0)
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
##D ## compute the competing trees
##D 
##D nested_trees <- nested.trees(fit_pltr$tree, data_pltr, Y.name, X.names, 
##D                             MaxTreeSize = 10, family = family)
## End(Not run)



