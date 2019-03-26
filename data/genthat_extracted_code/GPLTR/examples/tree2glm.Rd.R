library(GPLTR)


### Name: tree2glm
### Title: tree to GLM
### Aliases: tree2glm
### Keywords: documentation

### ** Examples

## Not run: 
##D ##load the data set
##D 
##D data(data_pltr)
##D 
##D ## set the parameters
##D 
##D args.rpart <- list(minbucket = 40, cp = 0)
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
##D ## Coerce a tree into a glm model using the confonding factor                     
##D 
##D fit_glm <- tree2glm(fit_pltr$tree, data_pltr, Y.name, X.names,
##D                     family = family)
##D                     
##D summary(fit_glm)
## End(Not run)      



