library(ggRandomForests)


### Name: gg_error
### Title: randomForestSRC error rate data object
### Aliases: gg_error gg_error.randomForest gg_error.randomForest.formula
###   gg_error.rfsrc

### ** Examples

## Examples from RFSRC package...
## ------------------------------------------------------------
## classification example
## ------------------------------------------------------------
## ------------- iris data
## You can build a randomForest
rfsrc_iris <- rfsrc(Species ~ ., data = iris)
# ... or load a cached randomForestSRC object
# data(rfsrc_iris, package="ggRandomForests")

# Get a data.frame containing error rates
gg_dta<- gg_error(rfsrc_iris)

# Plot the gg_error object
plot(gg_dta)

## ------------------------------------------------------------
## Regression example
## ------------------------------------------------------------
## Not run: 
##D ## ------------- airq data
##D rfsrc_airq <- rfsrc(Ozone ~ ., data = airquality, na.action = "na.impute")
##D 
##D # Get a data.frame containing error rates
##D gg_dta<- gg_error(rfsrc_airq)
##D 
##D # Plot the gg_error object
##D plot(gg_dta)
## End(Not run)
## Not run: 
##D ## ------------- Boston data
##D data(rfsrc_Boston, package="ggRandomForests")
##D 
##D # Get a data.frame containing error rates
##D gg_dta<- gg_error(rfsrc_Boston)
##D 
##D # Plot the gg_error object
##D plot(gg_dta)
## End(Not run)
## Not run: 
##D ## ------------- mtcars data
##D 
##D # Get a data.frame containing error rates
##D gg_dta<- gg_error(rfsrc_mtcars)
##D 
##D # Plot the gg_error object
##D plot(gg_dta)
## End(Not run)

## ------------------------------------------------------------
## Survival example
## ------------------------------------------------------------
## Not run: 
##D ## ------------- veteran data
##D ## randomized trial of two treatment regimens for lung cancer
##D data(veteran, package = "randomForestSRC")
##D rfsrc_veteran <- rfsrc(Surv(time, status) ~ ., data = dta$veteran, ...)
##D 
##D gg_dta <- gg_error(rfsrc_veteran)
##D plot(gg_dta)
## End(Not run)
## Not run: 
##D ## ------------- pbc data
##D # Load a cached randomForestSRC object
##D data(rfsrc_pbc, package="ggRandomForests")
##D 
##D gg_dta <- gg_error(rfsrc_pbc)
##D plot(gg_dta)
## End(Not run)



