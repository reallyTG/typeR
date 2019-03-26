library(itsadug)


### Name: rug_model
### Title: Add rug to plot, based on model.
### Aliases: rug_model

### ** Examples

plot(cars$speed, cars$dist, pch=16, col=alpha(1))
lm1 <- lm(dist ~ speed, dat=cars)
abline(lm1, col='red', lwd=2)
rug_model(lm1, view="speed")
rug_model(lm1, view="dist", side=2)

## Not run: 
##D library(itsadug)
##D data(simdat)
##D m1 <- bam(Y ~ Group + te(Time, Trial, by=Group), data=simdat)
##D # plot:
##D fvisgam(m1, view=c("Time", "Trial"), cond=list(Group="Adults"))
##D rug_model(m1, view="Time", cond=list(Group="Adults"))
##D rug_model(m1, view="Trial", cond=list(Group="Adults"), side=2)
## End(Not run)



