library(dsm)


### Name: dsm
### Title: Fit a density surface model to segment-specific estimates of
###   abundance or density.
### Aliases: dsm

### ** Examples

## Not run: 
##D library(Distance)
##D library(dsm)
##D 
##D # load the Gulf of Mexico dolphin data (see ?mexdolphins)
##D data(mexdolphins)
##D 
##D # fit a detection function and look at the summary
##D hr.model <- ds(distdata, max(distdata$distance),
##D                key = "hr", adjustment = NULL)
##D summary(hr.model)
##D 
##D # fit a simple smooth of x and y to counts
##D mod1 <- dsm(count~s(x,y), hr.model, segdata, obsdata)
##D summary(mod1)
##D 
##D # predict over a grid
##D mod1.pred <- predict(mod1, preddata, preddata$area)
##D 
##D # calculate the predicted abundance over the grid
##D sum(mod1.pred)
##D 
##D # plot the smooth
##D plot(mod1)
## End(Not run)



