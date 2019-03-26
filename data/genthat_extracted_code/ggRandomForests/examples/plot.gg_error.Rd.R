library(ggRandomForests)


### Name: plot.gg_error
### Title: Plot a 'gg_error' object
### Aliases: plot.gg_error

### ** Examples

## Not run: 
##D ## Examples from RFSRC package... 
##D ## ------------------------------------------------------------
##D ## classification example
##D ## ------------------------------------------------------------
##D ## ------------- iris data
##D ## You can build a randomForest
##D # rfsrc_iris <- rfsrc(Species ~ ., data = iris)
##D # ... or load a cached randomForestSRC object
##D data(rfsrc_iris, package="ggRandomForests")
##D 
##D # Get a data.frame containing error rates
##D gg_dta<- gg_error(rfsrc_iris)
##D 
##D # Plot the gg_error object
##D plot(gg_dta)
##D 
##D ## ------------------------------------------------------------
##D ## Regression example
##D ## ------------------------------------------------------------
##D ## ------------- airq data
##D # rfsrc_airq <- rfsrc(Ozone ~ ., data = airquality, na.action = "na.impute")
##D # ... or load a cached randomForestSRC object
##D data(rfsrc_airq, package="ggRandomForests")
##D 
##D # Get a data.frame containing error rates
##D gg_dta<- gg_error(rfsrc_airq)
##D 
##D # Plot the gg_error object
##D plot(gg_dta)
##D 
##D ## ------------- Boston data
##D data(rfsrc_Boston, package="ggRandomForests")
##D 
##D # Get a data.frame containing error rates
##D gg_dta<- gg_error(rfsrc_Boston)
##D 
##D # Plot the gg_error object
##D plot(gg_dta)
##D 
##D ## ------------- mtcars data
##D data(rfsrc_mtcars, package="ggRandomForests")
##D 
##D # Get a data.frame containing error rates
##D gg_dta<- gg_error(rfsrc_mtcars)
##D 
##D # Plot the gg_error object
##D plot(gg_dta)
##D 
##D ## ------------------------------------------------------------
##D ## Survival example
##D ## ------------------------------------------------------------
##D ## ------------- veteran data
##D ## randomized trial of two treatment regimens for lung cancer
##D # data(veteran, package = "randomForestSRC")
##D # rfsrc_veteran <- rfsrc(Surv(time, status) ~ ., data = veteran, ntree = 100)
##D 
##D # Load a cached randomForestSRC object
##D data(rfsrc_veteran, package="ggRandomForests")
##D 
##D gg_dta <- gg_error(rfsrc_veteran)
##D plot(gg_dta)
##D 
##D ## ------------- pbc data
##D # Load a cached randomForestSRC object
##D data(rfsrc_pbc, package="ggRandomForests")
##D 
##D gg_dta <- gg_error(rfsrc_pbc)
##D plot(gg_dta)
## End(Not run)



