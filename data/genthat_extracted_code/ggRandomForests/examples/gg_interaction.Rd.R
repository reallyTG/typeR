library(ggRandomForests)


### Name: gg_interaction
### Title: Minimal Depth Variable Interaction data object
###   ('find.interaction').
### Aliases: gg_interaction

### ** Examples

## Examples from randomForestSRC package... 
## ------------------------------------------------------------
## find interactions, classification setting
## ------------------------------------------------------------
## Not run: 
##D ## -------- iris data
##D ## iris.obj <- rfsrc(Species ~., data = iris)
##D ## TODO: VIMP interactions not handled yet....
##D ## randomForestSRC::find.interaction(iris.obj, method = "vimp", nrep = 3)
##D ## interaction_iris <- randomForestSRC::find.interaction(iris.obj)
##D data(interaction_iris, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_iris)
##D 
##D plot(gg_dta, xvar="Petal.Width")
##D plot(gg_dta, panel=TRUE)
## End(Not run)
## ------------------------------------------------------------
## find interactions, regression setting
## ------------------------------------------------------------
## Not run: 
##D ## -------- air quality data
##D ## airq.obj <- rfsrc(Ozone ~ ., data = airquality)
##D ##
##D ## TODO: VIMP interactions not handled yet....
##D ## randomForestSRC::find.interaction(airq.obj, method = "vimp", nrep = 3)
##D ## interaction_airq <- randomForestSRC::find.interaction(airq.obj)
##D data(interaction_airq, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_airq)
##D 
##D plot(gg_dta, xvar="Temp")
##D plot(gg_dta, xvar="Solar.R")
##D 
##D plot(gg_dta, panel=TRUE)
## End(Not run)
## Not run: 
##D ## -------- Boston data
##D data(interaction_Boston, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_Boston)
##D 
##D plot(gg_dta, panel=TRUE)
## End(Not run)
## Not run: 
##D ## -------- mtcars data
##D data(interaction_mtcars, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_mtcars)
##D 
##D plot(gg_dta, panel=TRUE)
## End(Not run)

## ------------------------------------------------------------
## find interactions, survival setting
## ------------------------------------------------------------
## -------- pbc data
## data(pbc, package = "randomForestSRC") 
## pbc.obj <- rfsrc(Surv(days,status) ~ ., pbc, nsplit = 10)
## interaction_pbc <- randomForestSRC::find.interaction(pbc.obj, nvar = 8)
## Not run: 
##D data(interaction_pbc, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_pbc)
##D 
##D plot(gg_dta, xvar="bili")
##D plot(gg_dta, panel=TRUE)
## End(Not run)
## Not run: 
##D ## -------- veteran data
##D data(interaction_veteran, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_veteran)
##D 
##D plot(gg_dta, panel=TRUE)
## End(Not run)




