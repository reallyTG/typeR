library(PCRedux)


### Name: earlyreg
### Title: A function to calculate the slope and intercept of an
###   amplification curve data from a quantitative PCR experiment.
### Aliases: earlyreg
### Keywords: intercept slope

### ** Examples


# Calculate slope and intercept on noise (negative) amplification curve data
# for the cycles 2 to 7 for the C316.amp data set
library(chipPCR)
data(C316.amp)

# Plot the data
plot(C316.amp[, 2], y=C316.amp[, 3], xlab="Cycle", ylab="RFU",
     main="C316.amp data set", lty=1, type="l")
res <- earlyreg(x=C316.amp[, 2], y=C316.amp[, 3], range=5)
res



