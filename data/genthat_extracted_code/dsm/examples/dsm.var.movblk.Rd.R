library(dsm)


### Name: dsm.var.movblk
### Title: Variance estimation via parametric moving block bootstrap
### Aliases: dsm.var.movblk

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
##D # fit a simple smooth of x and y
##D mod1 <- dsm(count~s(x, y), hr.model, segdata, obsdata)
##D summary(mod1)
##D 
##D # calculate the variance by 500 moving block bootstraps
##D mod1.movblk <- dsm.var.movblk(mod1, preddata, n.boot = 500,
##D    block.size = 3, samp.unit.name = "Transect.Label",
##D    off.set = preddata$area,
##D    bar = TRUE, bs.file = "mexico-bs.csv", ds.uncertainty = TRUE)
## End(Not run)



