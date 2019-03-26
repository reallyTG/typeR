library(ggRandomForests)


### Name: plot.gg_minimal_depth
### Title: Plot a 'gg_minimal_depth' object for random forest variable
###   ranking.
### Aliases: plot.gg_minimal_depth

### ** Examples

## Not run: 
##D ## Examples from RFSRC package... 
##D ## ------------------------------------------------------------
##D ## classification example
##D ## ------------------------------------------------------------
##D ## -------- iris data
##D ## You can build a randomForest
##D # rfsrc_iris <- rfsrc(Species ~ ., data = iris)
##D # varsel_iris <- var.select(rfsrc_iris)
##D # ... or load a cached randomForestSRC object
##D data(varsel_iris, package="ggRandomForests")
##D 
##D # Get a data.frame containing minimaldepth measures
##D gg_dta<- gg_minimal_depth(varsel_iris)
##D 
##D # Plot the gg_minimal_depth object
##D plot(gg_dta)
##D 
##D ## ------------------------------------------------------------
##D ## Regression example
##D ## ------------------------------------------------------------
##D ## -------- air quality data
##D # rfsrc_airq <- rfsrc(Ozone ~ ., data = airquality, na.action = "na.impute")
##D # varsel_airq <- var.select(rfsrc_airq)
##D # ... or load a cached randomForestSRC object
##D data(varsel_airq, package="ggRandomForests")
##D 
##D # Get a data.frame containing error rates
##D gg_dta<- gg_minimal_depth(varsel_airq)
##D 
##D # Plot the gg_minimal_depth object
##D plot(gg_dta)
##D 
##D ## -------- Boston data
##D data(varsel_Boston, package="ggRandomForests")
##D 
##D # Get a data.frame containing error rates
##D plot(gg_minimal_depth(varsel_Boston))
##D 
##D ## -------- mtcars data
##D data(varsel_mtcars, package="ggRandomForests")
##D 
##D # Get a data.frame containing error rates
##D plot.gg_minimal_depth(varsel_mtcars)
##D 
##D ## ------------------------------------------------------------
##D ## Survival example
##D ## ------------------------------------------------------------
##D ## -------- veteran data
##D ## veteran data
##D ## randomized trial of two treatment regimens for lung cancer
##D # data(veteran, package = "randomForestSRC")
##D # rfsrc_veteran <- rfsrc(Surv(time, status) ~ ., data = veteran, ntree = 100)
##D # varsel_veteran <- var.select(rfsrc_veteran)
##D # Load a cached randomForestSRC object
##D data(varsel_veteran, package="ggRandomForests")
##D 
##D gg_dta <- gg_minimal_depth(varsel_veteran)
##D plot(gg_dta)
##D 
##D ## -------- pbc data
##D data(varsel_pbc, package="ggRandomForests")
##D 
##D gg_dta <- gg_minimal_depth(varsel_pbc)
##D plot(gg_dta)
##D 
## End(Not run)




