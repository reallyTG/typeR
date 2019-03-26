library(event)


### Name: km
### Title: Kaplan-Meier Survivor Curves
### Aliases: km plot.surv plot.km print.km plot.intensity.km plot.dist
###   plot.dist.km
### Keywords: hplot

### ** Examples

surv <- rgamma(40,2,scale=5)
cens <- rbinom(40,1,0.9)
treat <- gl(2,20)
plot(km(surv, cens, group=treat), main="",xlab="Months",
	ylab="Probability of deterioration")
plot.dist(km(surv, cens, group=treat))
plot.intensity(km(surv, cens, group=treat),ylab="Risk of deterioration")



