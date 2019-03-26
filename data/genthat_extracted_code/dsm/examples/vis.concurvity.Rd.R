library(dsm)


### Name: vis.concurvity
### Title: Visualise concurvity between terms in a GAM
### Aliases: vis.concurvity

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
##D 
##D # fit a simple smooth of x and y to counts
##D mod1 <- dsm(count~s(x,y)+s(depth), hr.model, segdata, obsdata)
##D 
##D # visualise concurvity using the "estimate" metric
##D vis.concurvity(mod1)
## End(Not run)



