library(GPLTR)


### Name: p.val.tree
### Title: Compute the p-value
### Aliases: p.val.tree
### Keywords: documentation test

### ** Examples

## Not run: 
##D ## load the data set
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
##D                     family = family,iterMax = 5, iterMin = 3)
##D                      
##D ##prunned back the maximal tree by BIC or AIC criterion
##D 
##D tree_select <- best.tree.BIC.AIC(xtree = fit_pltr$tree,data_pltr,Y.name, 
##D                                  X.names, family = family)
##D                      
##D ## Compute the p-value of the selected tree by BIC
##D 
##D args.parallel = list(numWorkers = 10, type = "PSOCK")
##D index = tree_select$best_index[[1]]
##D p_value <- p.val.tree(xtree = fit_pltr$tree, data_pltr, Y.name, X.names, G.names,
##D             B = 100, args.rpart = args.rpart, epsi = 1e-3, 
##D             iterMax = 5, iterMin = 3, family = family, LB = FALSE, 
##D             args.parallel = args.parallel, index = index)
## End(Not run)



