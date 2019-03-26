library(GPLTR)


### Name: best.tree.permute
### Title: permutation test on a pltr model
### Aliases: best.tree.permute
### Keywords: documentation test

### ** Examples

## Not run: 
##D ##load the data set
##D 
##D data(data_pltr)
##D 
##D ## set the parameters
##D 
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
##D ## select an test the selected tree by a permutation test procedure
##D 
##D args.parallel = list(numWorkers = 1, type = "PSOCK")
##D 
##D best_permute <- best.tree.permute(fit_pltr$tree, data_pltr, Y.name, X.names,
##D   G.names, B = 10, args.rpart = args.rpart, epsi = 0.001, iterMax = 5,              
##D              iterMin = 3, family = family, LEVEL = 0.05,LB = FALSE, 
## End(Not run)                                   args.parallel = args.parallel)



