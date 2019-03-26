library(ggRandomForests)


### Name: gg_rfsrc.rfsrc
### Title: Predicted response data object
### Aliases: gg_rfsrc gg_rfsrc.rfsrc

### ** Examples

## ------------------------------------------------------------
## classification example
## ------------------------------------------------------------
## -------- iris data
rfsrc_iris <- rfsrc(Species ~ ., data = iris)
#data(rfsrc_iris, package="ggRandomForests")
gg_dta<- gg_rfsrc(rfsrc_iris)

plot(gg_dta)

## ------------------------------------------------------------
## Regression example
## ------------------------------------------------------------
## Not run: 
##D ## -------- air quality data
##D # rfsrc_airq <- rfsrc(Ozone ~ ., data = airquality, na.action = "na.impute")
##D data(rfsrc_airq, package="ggRandomForests")
##D gg_dta<- gg_rfsrc(rfsrc_airq)
##D 
##D plot(gg_dta)
## End(Not run)
## Not run: 
##D ## -------- Boston data
##D data(rfsrc_Boston, package="ggRandomForests")
##D plot(rfsrc_Boston) 
## End(Not run)
## Not run: 
##D ## -------- mtcars data
##D data(rfsrc_mtcars, package="ggRandomForests")
##D gg_dta<- gg_rfsrc(rfsrc_mtcars)
##D 
##D plot(gg_dta)
## End(Not run)
## ------------------------------------------------------------
## Survival example
## ------------------------------------------------------------
## Not run: 
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
## End(Not run)
## Not run: 
##D ## -------- pbc data
##D ## We don't run this because of bootstrap confidence limits
##D data(rfsrc_pbc, package = "ggRandomForests")
## End(Not run)
## Not run: 
##D gg_dta <- gg_rfsrc(rfsrc_pbc)
##D plot(gg_dta)
##D 
##D gg_dta <- gg_rfsrc(rfsrc_pbc, conf.int=.95)
##D plot(gg_dta)
## End(Not run)
## Not run: 
##D gg_dta <- gg_rfsrc(rfsrc_pbc, by="treatment")
##D plot(gg_dta)
## End(Not run)




