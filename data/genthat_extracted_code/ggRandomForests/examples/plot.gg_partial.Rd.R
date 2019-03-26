library(ggRandomForests)


### Name: plot.gg_partial
### Title: Partial variable dependence plot, operates on a 'gg_partial'
###   object.
### Aliases: plot.gg_partial

### ** Examples

## Not run: 
##D ## ------------------------------------------------------------
##D ## classification
##D ## ------------------------------------------------------------
##D ## -------- iris data
##D 
##D ## iris "Petal.Width" partial dependence plot
##D ##
##D # rfsrc_iris <- rfsrc(Species ~., data = iris)
##D # partial_iris <- plot.variable(rfsrc_iris, xvar.names = "Petal.Width",
##D #                            partial=TRUE)
##D data(partial_iris, package="ggRandomForests")
##D 
##D gg_dta <- gg_partial(partial_iris)
##D plot(gg_dta)
##D 
##D ## ------------------------------------------------------------
##D ## regression
##D ## ------------------------------------------------------------
##D ## -------- air quality data
##D ## airquality "Wind" partial dependence plot
##D ##
##D # rfsrc_airq <- rfsrc(Ozone ~ ., data = airquality)
##D # partial_airq <- plot.variable(rfsrc_airq, xvar.names = "Wind",
##D #                            partial=TRUE, show.plot=FALSE)
##D data(partial_airq, package="ggRandomForests")
##D 
##D gg_dta <- gg_partial(partial_airq)
##D plot(gg_dta)
##D 
##D gg_dta.m <- gg_dta[["Month"]]
##D plot(gg_dta.m, notch=TRUE)
##D 
##D gg_dta[["Month"]] <- NULL
##D plot(gg_dta, panel=TRUE)
##D 
##D ## -------- Boston data
##D data(partial_Boston, package="ggRandomForests")
##D 
##D gg_dta <- gg_partial(partial_Boston)
##D plot(gg_dta)
##D plot(gg_dta, panel=TRUE)
##D 
##D ## -------- mtcars data
##D data(partial_mtcars, package="ggRandomForests")
##D 
##D gg_dta <- gg_partial(partial_mtcars)
##D 
##D plot(gg_dta)
##D 
##D gg_dta.cat <- gg_dta
##D gg_dta.cat[["disp"]] <- gg_dta.cat[["wt"]] <- gg_dta.cat[["hp"]] <- NULL
##D gg_dta.cat[["drat"]] <- gg_dta.cat[["carb"]] <- gg_dta.cat[["qsec"]] <- NULL
##D  
##D plot(gg_dta.cat, panel=TRUE)
##D 
##D gg_dta[["cyl"]] <- gg_dta[["vs"]] <- gg_dta[["am"]] <- NULL
##D gg_dta[["gear"]] <- NULL
##D plot(gg_dta, panel=TRUE)
##D 
##D ## ------------------------------------------------------------
##D ## survival examples
##D ## ------------------------------------------------------------
##D ## -------- veteran data
##D ## survival "age" partial variable dependence plot
##D ##
##D # data(veteran, package = "randomForestSRC")
##D # rfsrc_veteran <- rfsrc(Surv(time,status)~., veteran, nsplit = 10, ntree = 100)
##D #
##D ## 30 day partial plot for age
##D # partial_veteran <- plot.variable(rfsrc_veteran, surv.type = "surv", 
##D #                               partial = TRUE, time=30, 
##D #                               xvar.names = "age", 
##D #                               show.plots=FALSE)
##D data(partial_veteran, package="ggRandomForests")
##D 
##D gg_dta <- gg_partial(partial_veteran[[1]])
##D plot(gg_dta)
##D 
##D gg_dta.cat <- gg_dta
##D gg_dta[["celltype"]] <- gg_dta[["trt"]] <- gg_dta[["prior"]] <- NULL
##D plot(gg_dta, panel=TRUE)
##D 
##D gg_dta.cat[["karno"]] <- gg_dta.cat[["diagtime"]] <- gg_dta.cat[["age"]] <- NULL 
##D plot(gg_dta.cat, panel=TRUE, notch=TRUE)
##D 
##D gg_dta <- lapply(partial_veteran, gg_partial)
##D length(gg_dta)
##D gg_dta <- combine.gg_partial(gg_dta[[1]], gg_dta[[2]] )
##D 
##D plot(gg_dta[["karno"]])
##D plot(gg_dta[["celltype"]])
##D 
##D gg_dta.cat <- gg_dta
##D gg_dta[["celltype"]] <- gg_dta[["trt"]] <- gg_dta[["prior"]] <- NULL
##D plot(gg_dta, panel=TRUE)
##D 
##D gg_dta.cat[["karno"]] <- gg_dta.cat[["diagtime"]] <- gg_dta.cat[["age"]] <- NULL 
##D plot(gg_dta.cat, panel=TRUE, notch=TRUE)
##D 
##D ## -------- pbc data
## End(Not run)
 



