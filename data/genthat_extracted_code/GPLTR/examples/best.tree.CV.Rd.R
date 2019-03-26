library(GPLTR)


### Name: best.tree.CV
### Title: Prunning the Maximal tree
### Aliases: best.tree.CV
### Keywords: documentation Machine Learning

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
##D ##prunned back the maximal tree by a cross-validation procedure
##D 
##D tree_selected <- best.tree.CV(fit_pltr$tree, data_pltr, Y.name, X.names, G.names, 
##D      family = family, args.rpart = args.rpart, epsi = 0.001, iterMax = 5, 
##D      iterMin = 3, ncv = 10)
##D      
##D plot(tree_selected$tree, main = 'CV TREE')
##D text(tree_selected$tree, minlength = 0L, xpd = TRUE, cex = .6)
## End(Not run)



