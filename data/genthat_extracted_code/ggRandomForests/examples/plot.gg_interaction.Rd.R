library(ggRandomForests)


### Name: plot.gg_interaction
### Title: plot.gg_interaction Plot a 'gg_interaction' object,
### Aliases: plot.gg_interaction

### ** Examples

## Not run: 
##D ## Examples from randomForestSRC package... 
##D ## ------------------------------------------------------------
##D ## find interactions, classification setting
##D ## ------------------------------------------------------------
##D ## -------- iris data
##D ## iris.obj <- rfsrc(Species ~., data = iris)
##D ## TODO: VIMP interactions not handled yet....
##D ## find.interaction(iris.obj, method = "vimp", nrep = 3)
##D ## interaction_iris <- find.interaction(iris.obj)
##D data(interaction_iris, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_iris)
##D 
##D plot(gg_dta, xvar="Petal.Width")
##D plot(gg_dta, xvar="Petal.Length")
##D plot(gg_dta, panel=TRUE)
##D 
##D ## ------------------------------------------------------------
##D ## find interactions, regression setting
##D ## ------------------------------------------------------------
##D ## -------- air quality data
##D ## airq.obj <- rfsrc(Ozone ~ ., data = airquality)
##D ##
##D ## TODO: VIMP interactions not handled yet....
##D ## find.interaction(airq.obj, method = "vimp", nrep = 3)
##D ## interaction_airq <- find.interaction(airq.obj)
##D data(interaction_airq, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_airq)
##D 
##D plot(gg_dta, xvar="Temp")
##D plot(gg_dta, xvar="Solar.R")
##D plot(gg_dta, panel=TRUE)
##D 
##D ## -------- Boston data
##D data(interaction_Boston, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_Boston)
##D 
##D plot(gg_dta, panel=TRUE)
##D 
##D ## -------- mtcars data
##D data(interaction_mtcars, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_mtcars)
##D 
##D plot(gg_dta, panel=TRUE)
##D 
##D ## ------------------------------------------------------------
##D ## find interactions, survival setting
##D ## ------------------------------------------------------------
##D ## -------- pbc data
##D ## data(pbc, package = "randomForestSRC") 
##D ## pbc.obj <- rfsrc(Surv(days,status) ~ ., pbc, nsplit = 10)
##D ## interaction_pbc <- find.interaction(pbc.obj, nvar = 8)
##D data(interaction_pbc, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_pbc)
##D 
##D plot(gg_dta, xvar="bili")
##D plot(gg_dta, xvar="copper")
##D plot(gg_dta, panel=TRUE)
##D 
##D ## -------- veteran data
##D data(interaction_veteran, package="ggRandomForests")
##D gg_dta <- gg_interaction(interaction_veteran)
##D 
##D plot(gg_dta, panel=TRUE)
##D 
## End(Not run)




