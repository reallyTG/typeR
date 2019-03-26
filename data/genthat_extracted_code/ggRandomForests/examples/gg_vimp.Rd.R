library(ggRandomForests)


### Name: gg_vimp
### Title: Variable Importance (VIMP) data object
### Aliases: gg_vimp gg_vimp.randomForest gg_vimp.randomForest.formula
###   gg_vimp.rfsrc

### ** Examples

## ------------------------------------------------------------
## classification example
## ------------------------------------------------------------
## -------- iris data
rfsrc_iris <- rfsrc(Species ~ ., data = iris)
#data(rfsrc_iris, package="ggRandomForests")
gg_dta <- gg_vimp(rfsrc_iris)
plot(gg_dta)
 
## ------------------------------------------------------------
## regression example
## ------------------------------------------------------------
## Not run: 
##D ## -------- air quality data 
##D # rfsrc_airq <- rfsrc(Ozone ~ ., airquality)
##D data(rfsrc_airq, package="ggRandomForests")
##D gg_dta <- gg_vimp(rfsrc_airq)
##D plot(gg_dta)
## End(Not run)
## Not run: 
##D ## -------- Boston data
##D data(rfsrc_Boston, package="ggRandomForests")
##D gg_dta <- gg_vimp(rfsrc_Boston)
##D plot(gg_dta)
## End(Not run)
## Not run: 
##D ## -------- mtcars data
##D data(rfsrc_mtcars, package="ggRandomForests")
##D gg_dta <- gg_vimp(rfsrc_mtcars)
##D plot(gg_dta)
## End(Not run)
## ------------------------------------------------------------
## survival example
## ------------------------------------------------------------
## Not run: 
##D ## -------- veteran data
##D data(rfsrc_veteran, package="ggRandomForests")
##D gg_dta <- gg_vimp(rfsrc_veteran)
##D plot(gg_dta)
## End(Not run)
## Not run: 
##D ## -------- pbc data
##D data(rfsrc_pbc, package="ggRandomForests")
##D gg_dta <- gg_vimp(rfsrc_pbc)
##D plot(gg_dta)
##D 
##D # Restrict to only the top 10.
##D gg_dta <- gg_vimp(rfsrc_pbc, nvar=10)
##D plot(gg_dta)
## End(Not run)



