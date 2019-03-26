library(GPLTR)


### Name: pltr.glm
### Title: Partially tree-based regression model function
### Aliases: pltr.glm
### Keywords: documentation tree Machine Learning

### ** Examples

data(burn)

args.rpart <- list(minbucket = 10, maxdepth = 4, cp = 0, maxcompete = 0, 
                    maxsurrogate = 0)
 family <- "binomial"
 X.names = "Z2"
 Y.name = "D2"
 G.names = c('Z1','Z3','Z4','Z5','Z6','Z7','Z8','Z9','Z10','Z11')
 
pltr.burn <- pltr.glm(burn, Y.name, X.names, G.names, args.rpart = args.rpart,
                   family = family, iterMax = 4, iterMin = 3, verbose = FALSE)


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
##D plot(fit_pltr$tree, main = 'MAXIMAL TREE')
##D text(fit_pltr$tree, minlength = 0L, xpd = TRUE, cex = .6)
## End(Not run)



