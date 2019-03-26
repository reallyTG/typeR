library(ggRandomForests)


### Name: plot.gg_variable
### Title: Plot a 'gg_variable' object,
### Aliases: plot.gg_variable

### ** Examples

## Not run: 
##D ## ------------------------------------------------------------
##D ## classification
##D ## ------------------------------------------------------------
##D ## -------- iris data
##D ## iris
##D #rfsrc_iris <- rfsrc(Species ~., data = iris)
##D data(rfsrc_iris, package="ggRandomForests")
##D 
##D gg_dta <- gg_variable(rfsrc_iris)
##D plot(gg_dta, xvar="Sepal.Width")
##D plot(gg_dta, xvar="Sepal.Length")
##D 
##D ## !! TODO !! this needs to be corrected
##D plot(gg_dta, xvar=rfsrc_iris$xvar.names, 
##D      panel=TRUE, se=FALSE)
##D 
##D ## ------------------------------------------------------------
##D ## regression
##D ## ------------------------------------------------------------
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
##D plot(gg_dta, xvar=c("Solar.R", "Wind", "Temp", "Day"), panel=TRUE)
##D 
##D plot(gg_dta, xvar="Month", notch=TRUE)
##D 
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
##D # panel
##D plot(gg_dta,xvar=c("disp","hp", "drat", "wt", "qsec"),  panel=TRUE)
##D plot(gg_dta, xvar=c("cyl", "vs", "am", "gear", "carb") ,panel=TRUE)
##D 
##D ## -------- Boston data
##D 
##D ## ------------------------------------------------------------
##D ## survival examples
##D ## ------------------------------------------------------------
##D ## -------- veteran data
##D ## survival
##D data(veteran, package = "randomForestSRC")
##D rfsrc_veteran <- rfsrc(Surv(time,status)~., veteran, nsplit = 10, ntree = 100)
##D 
##D # get the 1 year survival time.
##D gg_dta <- gg_variable(rfsrc_veteran, time=90)
##D 
##D # Generate variable dependance plots for age and diagtime
##D plot(gg_dta, xvar = "age")
##D plot(gg_dta, xvar = "diagtime")
##D 
##D # Generate coplots
##D plot(gg_dta, xvar = c("age", "diagtime"), panel=TRUE)
##D 
##D # If we want to compare survival at different time points, say 30, 90 day 
##D # and 1 year
##D gg_dta <- gg_variable(rfsrc_veteran, time=c(30, 90, 365))
##D 
##D # Generate variable dependance plots for age and diagtime
##D plot(gg_dta, xvar = "age")
##D plot(gg_dta, xvar = "diagtime") 
##D 
##D # Generate coplots
##D plot(gg_dta, xvar =  c("age", "diagtime"), panel=TRUE)
##D 
##D ## -------- pbc data
## End(Not run)




