library(ggRandomForests)


### Name: print.gg_minimal_depth
### Title: Print a 'gg_minimal_depth' object.
### Aliases: print.gg_minimal_depth

### ** Examples

## ------------------------------------------------------------
## classification example
## ------------------------------------------------------------
## Not run: 
##D ## You can build a randomForest
##D # rfsrc_iris <- rfsrc(Species ~ ., data = iris)
##D # varsel_iris <- var.select(rfsrc_iris)
##D # ... or load a cached randomForestSRC object
##D data(varsel_iris, package="ggRandomForests")
##D 
##D # Get a data.frame containing minimaldepth measures
##D gg_dta <- gg_minimal_depth(varsel_iris)
##D print(gg_dta)
## End(Not run)
## ------------------------------------------------------------
## regression example
## ------------------------------------------------------------
## Not run: 
##D # ... or load a cached randomForestSRC object
##D data(varsel_airq, package="ggRandomForests")
##D 
##D # Get a data.frame containing minimaldepth measures
##D gg_dta<- gg_minimal_depth(varsel_airq)
##D print(gg_dta)
##D 
##D # To nicely print a rfsrc::var.select output... 
##D print(varsel_airq)
## End(Not run)
## Not run: 
##D # ... or load a cached randomForestSRC object
##D data(varsel_Boston, package="ggRandomForests")
##D 
##D # Get a data.frame containing minimaldepth measures
##D gg_dta<- gg_minimal_depth(varsel_Boston)
##D print(gg_dta)
##D 
##D # To nicely print a rfsrc::var.select output... 
##D print(varsel_Boston)
## End(Not run)



