library(kmconfband)


### Name: plotbands
### Title: Plot an Exact Nonparametric Confidence Band for the Population
###   Survivor Function
### Aliases: plotbands
### Keywords: survival aplot

### ** Examples

## plot an exact, nonparametric, 95% confidence band for leukemia patient 
## remission experience based on data from 20 patients receiving 
## Treatment B
time<-c(1,1,2,2,3,4,5,8,8,9,11,12,14,16,18,21,27,31,38,44)
status<-c(rep(1,16),0,1,0,1)
fit<-survfit(Surv(time,status)~1)
plotbands(fit,xlab="Time (in months)",ylab="Probability")

## Repeat the same calculations, but require only 80% confidence
plotbands(fit,0.80,xlab="Time (in months)",ylab="Probability")



