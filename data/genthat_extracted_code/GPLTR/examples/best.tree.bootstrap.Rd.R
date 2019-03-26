library(GPLTR)


### Name: best.tree.bootstrap
### Title: parametric bootstrap on a pltr model
### Aliases: best.tree.bootstrap
### Keywords: documentation test

### ** Examples

#load the data set
data(data_pltr)
args.rpart <- list(minbucket = 40, maxdepth = 10, cp = 0)
family <- "binomial"
Y.name <- "Y"
X.names <- "G1"
G.names <- paste("G", 2:15, sep="")
## Not run: 
##D ## build a maximal tree
##D 
##D fit_pltr <- pltr.glm(data_pltr, Y.name, X.names, G.names, 
##D    args.rpart = args.rpart, family = family, iterMax = 5, iterMin = 3)
##D                      
##D ## select an test the selected tree by a parametric bootstrap procedure
##D args.parallel = list(numWorkers = 1, type = "PSOCK")
##D 
##D best_bootstrap <- best.tree.bootstrap(fit_pltr$tree, data_pltr, Y.name, X.names, 
##D   G.names, B = 10, BB = 10, args.rpart = args.rpart, epsi = 0.001, 
##D   iterMax = 5, iterMin = 3, family = family, LEVEL = 0.05,LB = FALSE, 
##D   args.parallel = args.parallel)
##D   
## End(Not run)



