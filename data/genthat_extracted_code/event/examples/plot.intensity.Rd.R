library(event)


### Name: plot.intensity
### Title: Plot Intensity Functions
### Aliases: plot.intensity plot.intensity.default
### Keywords: hplot

### ** Examples

surv <- rgamma(40,2,scale=5)
cens <- rbinom(40,1,0.9)
treat <- gl(2,20)
plot(km(surv, cens, group=treat), main="",xlab="Months",
	ylab="Probability of deterioration")
plot.dist(km(surv, cens, group=treat))
plot.intensity(km(surv, cens, group=treat),ylab="Risk of deterioration")



