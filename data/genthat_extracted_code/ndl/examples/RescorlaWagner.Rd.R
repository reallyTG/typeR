library(ndl)


### Name: RescorlaWagner
### Title: Implementation of the Rescorla-Wagner equations.
### Aliases: RescorlaWagner
### Keywords: classif

### ** Examples

data(lexample)
lexample$Cues <- orthoCoding(lexample$Word, grams=1)
lexample.rw <- RescorlaWagner(lexample, nruns=25, 
   traceCue="h", traceOutcome="hand")
plot(lexample.rw)

data(numbers)
traceCues=c( "exactly1", "exactly2", "exactly3", "exactly4",
   "exactly5", "exactly6", "exactly7", "exactly10", "exactly15")
traceOutcomes=c("1", "2", "3", "4", "5", "6", "7", "10", "15")
ylimit=c(0,1)
par(mfrow=c(3,3),mar=c(4,4,1,1))
     
for(i in 1:length(traceCues)) {
   numbers.rw <- RescorlaWagner(numbers, nruns=1,
      traceCue=traceCues[i], traceOutcome=traceOutcomes[i])
    plot(numbers.rw, ylimit=ylimit)
    mtext(paste(traceCues[i], " - ", traceOutcomes[i], sep=""), 
       side=3, line=-1, cex=0.7)
  }
par(mfrow=c(1,1))




