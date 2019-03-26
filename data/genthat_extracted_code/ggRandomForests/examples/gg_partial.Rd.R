library(ggRandomForests)


### Name: gg_partial
### Title: Partial variable dependence object
### Aliases: gg_partial gg_partial.randomForest gg_partial.rfsrc
###   gg_partial_list

### ** Examples

## ------------------------------------------------------------
## classification
## ------------------------------------------------------------
## -------- iris data
## Not run: 
##D ## iris "Petal.Width" partial dependence plot
##D ##
##D # rfsrc_iris <- rfsrc(Species ~., data = iris)
##D # partial_iris <- plot.variable(rfsrc_iris, xvar.names = "Petal.Width",
##D #                            partial=TRUE)
##D data(partial_iris, package="ggRandomForests")
##D 
##D gg_dta <- gg_partial(partial_iris)
##D plot(gg_dta)
## End(Not run)
## ------------------------------------------------------------
## regression
## ------------------------------------------------------------
## Not run: 
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
## End(Not run)
## Not run: 
##D ## -------- Boston data
##D data(partial_Boston, package="ggRandomForests")
##D 
##D gg_dta <- gg_partial(partial_Boston)
##D plot(gg_dta, panel=TRUE)
## End(Not run)
## Not run: 
##D ## -------- mtcars data
##D data(partial_mtcars, package="ggRandomForests")
##D gg_dta <- gg_partial(partial_mtcars)
##D 
##D gg_dta.cat <- gg_dta
##D gg_dta.cat[["disp"]] <- gg_dta.cat[["wt"]] <- gg_dta.cat[["hp"]] <- NULL
##D gg_dta.cat[["drat"]] <- gg_dta.cat[["carb"]] <- gg_dta.cat[["qsec"]] <- NULL
##D  
##D plot(gg_dta.cat, panel=TRUE, notch=TRUE)
##D 
##D gg_dta[["cyl"]] <- gg_dta[["vs"]] <- gg_dta[["am"]] <- NULL
##D gg_dta[["gear"]] <- NULL
##D plot(gg_dta, panel=TRUE)
## End(Not run)

## ------------------------------------------------------------
## survival examples
## ------------------------------------------------------------
## Not run: 
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
## End(Not run)
## Not run: 
##D ## -------- pbc data
##D data("partial_pbc", package = "ggRandomForests")
##D data("varsel_pbc", package = "ggRandomForests")
##D xvar <- varsel_pbc$topvars
##D 
##D # Convert all partial plots to gg_partial objects
##D gg_dta <- lapply(partial_pbc, gg_partial)
##D 
##D # Combine the objects to get multiple time curves 
##D # along variables on a single figure.
##D pbc_ggpart <- combine.gg_partial(gg_dta[[1]], gg_dta[[2]], 
##D                                  lbls = c("1 Year", "3 Years"))
##D 
##D summary(pbc_ggpart)
##D class(pbc_ggpart[["bili"]])
##D 
##D # Plot the highest ranked variable, by name.
##D #plot(pbc_ggpart[["bili"]])
##D      
##D # Create a temporary holder and remove the stage and edema data
##D ggpart <- pbc_ggpart
##D ggpart$edema <- NULL
##D 
##D # Panel plot the remainder.
##D plot(ggpart, panel = TRUE)
##D 
##D #plot(pbc_ggpart[["edema"]], panel=TRUE) #,
##D      # notch = TRUE, alpha = .3, outlier.shape = NA) 
##D   
## End(Not run)



