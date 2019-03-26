library(ndl)


### Name: numbers
### Title: Example data illustrating the Rescorla-Wagner equations as
###   applied to numerical cognition by Ramscar et al. (2011).
### Aliases: numbers
### Keywords: datasets

### ** Examples

data(numbers)

traceCues=c( "exactly1", "exactly2", "exactly3", "exactly4",
"exactly5", "exactly6", "exactly7", "exactly10", "exactly15")
traceOutcomes=c("1", "2", "3", "4", "5", "6", "7", "10", "15")

ylimit=c(0,1)
par(mfrow=c(3,3),mar=c(4,4,1,1))

for (i in 1:length(traceCues)){
  numbers.rw = RescorlaWagner(numbers, nruns=1,
    traceCue=traceCues[i],traceOutcome=traceOutcomes[i])
  plot(numbers.rw, ylimit=ylimit)
  mtext(paste(traceCues[i], " - ", traceOutcomes[i], sep=""), 
    side=3, line=-1, cex=0.7)
}
par(mfrow=c(1,1))




