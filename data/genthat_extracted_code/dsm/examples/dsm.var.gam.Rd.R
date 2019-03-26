library(dsm)


### Name: dsm.var.gam
### Title: Prediction variance estimation assuming independence
### Aliases: dsm.var.gam

### ** Examples

## Not run: 
##D  library(Distance)
##D  library(dsm)
##D 
##D  # load the Gulf of Mexico dolphin data (see ?mexdolphins)
##D  data(mexdolphins)
##D 
##D  # fit a detection function and look at the summary
##D  hr.model <- ds(distdata, max(distdata$distance),
##D                 key = "hr", adjustment = NULL)
##D  summary(hr.model)
##D 
##D  # fit a simple smooth of x and y
##D  mod1 <- dsm(count~s(x, y), hr.model, segdata, obsdata)
##D 
##D  # Calculate the variance
##D  # this will give a summary over the whole area in mexdolphins$preddata
##D  mod1.var <- dsm.var.gam(mod1, preddata, off.set=preddata$area)
## End(Not run)



