library(dsm)


### Name: plot_pred_by_term
### Title: Spatially plot predictions per model term
### Aliases: plot_pred_by_term

### ** Examples

## Not run: 
##D library(Distance)
##D library(dsm)
##D 
##D # load the Gulf of Mexico dolphin data and fit a model
##D data(mexdolphins)
##D hr.model <- ds(distdata, max(distdata$distance),
##D                key = "hr", adjustment = NULL)
##D mod1 <- dsm(count~s(x,y) + s(depth), hr.model, segdata, obsdata)
##D 
##D preddata$width <- preddata$height <- sqrt(preddata$area)
##D 
##D # make the plot
##D plot_pred_by_term(mod1, preddata, c("x","y"))
##D 
##D # better plot would be
##D # library(viridis)
##D # plot_pred_by_term(mod1, preddata, c("x","y")) + scale_fill_viridis()
## End(Not run)



