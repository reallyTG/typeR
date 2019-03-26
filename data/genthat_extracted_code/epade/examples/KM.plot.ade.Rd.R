library(epade)


### Name: KM.plot.ade
### Title: Kaplan-Meier curves
### Aliases: KM.plot.ade
### Keywords: Kaplan-Meier

### ** Examples

times<-  sort(abs(rnorm(1000)))
events<- round(runif(1000))
groups<- round(runif(1000, 0, 3))
KM.plot.ade(times, events,  groups, wall=2)



