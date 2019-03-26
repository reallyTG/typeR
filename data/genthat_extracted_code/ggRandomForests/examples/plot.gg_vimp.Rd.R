library(ggRandomForests)


### Name: plot.gg_vimp
### Title: Plot a 'gg_vimp' object, extracted variable importance of a
###   'rfsrc' object
### Aliases: plot.gg_vimp

### ** Examples

## Not run: 
##D ## ------------------------------------------------------------
##D ## classification example
##D ## ------------------------------------------------------------
##D ## -------- iris data
##D # rfsrc_iris <- rfsrc(Species ~ ., data = iris)
##D data(rfsrc_iris, package="ggRandomForests")
##D gg_dta <- gg_vimp(rfsrc_iris)
##D plot(gg_dta)
##D  
##D ## ------------------------------------------------------------
##D ## regression example
##D ## ------------------------------------------------------------
##D ## -------- air quality data 
##D # rfsrc_airq <- rfsrc(Ozone ~ ., airquality)
##D data(rfsrc_airq, package="ggRandomForests")
##D gg_dta <- gg_vimp(rfsrc_airq)
##D plot(gg_dta)
##D 
##D ## -------- Boston data
##D data(rfsrc_Boston, package="ggRandomForests")
##D gg_dta <- gg_vimp(rfsrc_Boston)
##D plot(gg_dta)
##D 
##D ## -------- mtcars data
##D data(rfsrc_mtcars, package="ggRandomForests")
##D gg_dta <- gg_vimp(rfsrc_mtcars)
##D plot(gg_dta)
##D 
##D ## ------------------------------------------------------------
##D ## survival example
##D ## ------------------------------------------------------------
##D ## -------- veteran data
##D data(rfsrc_veteran, package="ggRandomForests")
##D gg_dta <- gg_vimp(rfsrc_veteran)
##D plot(gg_dta)
##D 
##D ## -------- pbc data
##D data(rfsrc_pbc, package="ggRandomForests")
##D gg_dta <- gg_vimp(rfsrc_pbc)
##D plot(gg_dta)
##D 
## End(Not run)




