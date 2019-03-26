library(ggRandomForests)


### Name: gg_variable
### Title: Marginal variable depedance data object.
### Aliases: gg_variable gg_variable.rfsrc

### ** Examples

## ------------------------------------------------------------
## classification
## ------------------------------------------------------------
## -------- iris data
## iris
 rfsrc_iris <- rfsrc(Species ~., data = iris)
#data(rfsrc_iris, package="ggRandomForests")

gg_dta <- gg_variable(rfsrc_iris)
plot(gg_dta, xvar="Sepal.Width")
plot(gg_dta, xvar="Sepal.Length")

plot(gg_dta, xvar=rfsrc_iris$xvar.names, 
     panel=TRUE) # , se=FALSE)

## ------------------------------------------------------------
## regression
## ------------------------------------------------------------
## Not run: 
##D ## -------- air quality data
##D #rfsrc_airq <- rfsrc(Ozone ~ ., data = airquality)
##D data(rfsrc_airq, package="ggRandomForests")
##D gg_dta <- gg_variable(rfsrc_airq)
##D 
##D # an ordinal variable 
##D gg_dta[,"Month"] <- factor(gg_dta[,"Month"])
##D 
##D plot(gg_dta, xvar="Wind")
##D plot(gg_dta, xvar="Temp")
##D plot(gg_dta, xvar="Solar.R")
##D 
##D 
##D plot(gg_dta, xvar=c("Solar.R", "Wind", "Temp", "Day"), panel=TRUE)
##D 
##D plot(gg_dta, xvar="Month", notch=TRUE)
## End(Not run)
## Not run: 
##D ## -------- motor trend cars data
##D #rfsrc_mtcars <- rfsrc(mpg ~ ., data = mtcars)
##D data(rfsrc_mtcars, package="ggRandomForests")
##D gg_dta <- gg_variable(rfsrc_mtcars)
##D 
##D # mtcars$cyl is an ordinal variable 
##D gg_dta$cyl <- factor(gg_dta$cyl)
##D gg_dta$am <- factor(gg_dta$am)
##D gg_dta$vs <- factor(gg_dta$vs)
##D gg_dta$gear <- factor(gg_dta$gear)
##D gg_dta$carb <- factor(gg_dta$carb)
##D 
##D plot(gg_dta, xvar="cyl")
##D 
##D # Others are continuous
##D plot(gg_dta, xvar="disp")
##D plot(gg_dta, xvar="hp")
##D plot(gg_dta, xvar="wt")
##D 
##D 
##D # panels
##D plot(gg_dta,xvar=c("disp","hp", "drat", "wt", "qsec"),  panel=TRUE)
##D plot(gg_dta, xvar=c("cyl", "vs", "am", "gear", "carb"), panel=TRUE, notch=TRUE)
## End(Not run)
## -------- Boston data

## ------------------------------------------------------------
## survival examples
## ------------------------------------------------------------
## Not run: 
##D ## -------- veteran data
##D ## survival
##D # data(veteran, package = "randomForestSRC")
##D # rfsrc_veteran <- rfsrc(Surv(time,status)~., veteran, nsplit = 10, ntree = 100)
##D data(rfsrc_veteran, package="ggRandomForests")
##D 
##D # get the 1 year survival time.
##D gg_dta <- gg_variable(rfsrc_veteran, time=90)
##D 
##D # Generate variable dependance plots for age and diagtime
##D plot(gg_dta, xvar = "age")
##D plot(gg_dta, xvar = "diagtime", )
##D 
##D # Generate coplots
##D plot(gg_dta, xvar = c("age", "diagtime"), panel=TRUE, se=FALSE)
##D 
##D # If we want to compare survival at different time points, say 30, 90 day 
##D # and 1 year
##D gg_dta <- gg_variable(rfsrc_veteran, time=c(30, 90, 365))
##D 
##D # Generate variable dependance plots for age and diagtime
##D plot(gg_dta, xvar = "age")
## End(Not run)
## -------- pbc data



