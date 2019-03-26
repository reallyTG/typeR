library(ggRandomForests)


### Name: partial.rfsrc
### Title: randomForestSRC partial dependence (data object) (modified from
###   randomForestSRC V1.6.0)
### Aliases: partial.rfsrc

### ** Examples

## ------------------------------------------------------------
## survival/competing risk
## ------------------------------------------------------------

## survival
## Not run: 
##D data(veteran, package = "randomForestSRC")
##D v.obj <- rfsrc(Surv(time,status)~., veteran, nsplit = 10, ntree = 100)
##D plot.variable(v.obj, plots.per.page = 3)
##D plot.variable(v.obj, plots.per.page = 2, xvar.names = c("trt", "karno", "age"))
##D plot.variable(v.obj, surv.type = "surv", nvar = 1)
##D plot.variable(v.obj, surv.type = "surv", partial = TRUE, smooth.lines = TRUE)
##D plot.variable(v.obj, surv.type = "rel.freq", partial = TRUE, nvar = 2)
##D 
##D ## example of plot.variable calling a pre-processed plot.variable object
##D p.v <- plot.variable(v.obj, surv.type = "surv", partial = TRUE, smooth.lines = TRUE)
##D plot.variable(p.v)
##D p.v$plots.per.page <- 1
##D p.v$smooth.lines <- FALSE
##D plot.variable(p.v)
## End(Not run)
## Not run: 
##D ## competing risks
##D data(follic, package = "randomForestSRC")
##D follic.obj <- rfsrc(Surv(time, status) ~ ., follic, nsplit = 3, ntree = 100)
##D plot.variable(follic.obj, which.outcome = 2)
## End(Not run)
## ------------------------------------------------------------
## regression
## ------------------------------------------------------------
## Not run: 
##D ## airquality
##D airq.obj <- rfsrc(Ozone ~ ., data = airquality)
##D plot.variable(airq.obj, partial = TRUE, smooth.lines = TRUE)
##D ## motor trend cars
##D mtcars.obj <- rfsrc(mpg ~ ., data = mtcars)
##D plot.variable(mtcars.obj, partial = TRUE, smooth.lines = TRUE)
## End(Not run)
## ------------------------------------------------------------
## classification
## ------------------------------------------------------------

## iris
#rfsrc_iris <- rfsrc(Species ~., data = iris)
#data(rfsrc_iris, package="ggRandomForests")
#gg_dta <- partial.rfsrc(rfsrc_iris, )

## Not run: 
##D ## motor trend cars: predict number of carburetors
##D mtcars2 <- mtcars
##D mtcars2$carb <- factor(mtcars2$carb,
##D                        labels = paste("carb", sort(unique(mtcars$carb))))
##D mtcars2.obj <- rfsrc(carb ~ ., data = mtcars2)
##D plot.variable(mtcars2.obj, partial = TRUE)
## End(Not run)





