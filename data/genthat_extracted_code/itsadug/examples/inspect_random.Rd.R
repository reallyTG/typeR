library(itsadug)


### Name: inspect_random
### Title: Inspection and interpretation of random factor smooths.
### Aliases: inspect_random

### ** Examples

# load data:
data(simdat)

## Not run: 
##D # Condition as factor, to have a random intercept
##D # for illustration purposes:
##D simdat$Condition <- as.factor(simdat$Condition)
##D 
##D # Model with random effect and interactions:
##D m2 <- bam(Y ~ s(Time) + s(Trial)
##D + ti(Time, Trial)
##D + s(Condition, bs='re')
##D + s(Time, Subject, bs='fs', m=1),
##D data=simdat)
##D 
##D # extract with wrong select value:
##D newd <- inspect_random(m2, select=4)
##D # results in warning, automatically takes select=5
##D head(newd)
##D inspect_random(m2, select=5, cond=list(Subject=c('a01','a02','a03')))
##D 
##D # Alternatively, fix random effect of Condition, and plot 
##D # random effects for subjects with lattice:
##D newd <- inspect_random(m2, select=5,
##D     cond=list(Subject=unique(simdat[simdat$Condition==0,'Subject'])),
##D     plot=FALSE)
##D 
##D # Make lattice plot:
##D require(lattice)
##D lattice::xyplot(fit~Time | Subject,
##D     data=newd, type="l",
##D     xlab="Time", ylab="Partial effect")
##D 
##D # Using argument 'fun':
##D inspect_random(m2, select=5, fun=mean, 
##D     cond=list(Subject=unique(simdat[simdat$Condition==0,'Subject'])))
##D inspect_random(m2, select=5, fun=mean, 
##D     cond=list(Subject=unique(simdat[simdat$Condition==2,'Subject'])),
##D     col='red', add=TRUE)
## End(Not run)

# see the vignette for examples:
vignette("overview", package="itsadug")



