library(ggRandomForests)


### Name: plot.gg_rfsrc
### Title: Predicted response plot from a 'gg_rfsrc' object.
### Aliases: plot.gg_rfsrc

### ** Examples

## Not run: 
##D ## ------------------------------------------------------------
##D ## classification example
##D ## ------------------------------------------------------------
##D ## -------- iris data
##D # rfsrc_iris <- rfsrc(Species ~ ., data = iris)
##D data(rfsrc_iris, package="ggRandomForests")
##D gg_dta<- gg_rfsrc(rfsrc_iris)
##D 
##D plot(gg_dta)
##D 
##D ## ------------------------------------------------------------
##D ## Regression example
##D ## ------------------------------------------------------------
##D ## -------- air quality data
##D # rfsrc_airq <- rfsrc(Ozone ~ ., data = airquality, na.action = "na.impute")
##D data(rfsrc_airq, package="ggRandomForests")
##D gg_dta<- gg_rfsrc(rfsrc_airq)
##D 
##D plot(gg_dta)
##D 
##D ## -------- Boston data
##D data(rfsrc_Boston, package="ggRandomForests")
##D plot(rfsrc_Boston) 
##D 
##D ## -------- mtcars data
##D data(rfsrc_mtcars, package="ggRandomForests")
##D gg_dta<- gg_rfsrc(rfsrc_mtcars)
##D 
##D plot(gg_dta)
##D 
##D ## ------------------------------------------------------------
##D ## Survival example
##D ## ------------------------------------------------------------
##D ## -------- veteran data
##D ## randomized trial of two treatment regimens for lung cancer
##D # data(veteran, package = "randomForestSRC")
##D # rfsrc_veteran <- rfsrc(Surv(time, status) ~ ., data = veteran, ntree = 100)
##D data(rfsrc_veteran, package = "ggRandomForests")
##D gg_dta <- gg_rfsrc(rfsrc_veteran)
##D plot(gg_dta)
##D 
##D gg_dta <- gg_rfsrc(rfsrc_veteran, conf.int=.95)
##D plot(gg_dta)
##D 
##D gg_dta <- gg_rfsrc(rfsrc_veteran, by="trt")
##D plot(gg_dta)
##D 
##D ## -------- pbc data
##D data(rfsrc_pbc, package = "ggRandomForests")
##D gg_dta <- gg_rfsrc(rfsrc_pbc)
##D plot(gg_dta)
##D 
##D gg_dta <- gg_rfsrc(rfsrc_pbc, conf.int=.95)
##D plot(gg_dta)
##D 
##D gg_dta <- gg_rfsrc(rfsrc_pbc, by="treatment")
##D plot(gg_dta)
##D 
##D 
## End(Not run)



