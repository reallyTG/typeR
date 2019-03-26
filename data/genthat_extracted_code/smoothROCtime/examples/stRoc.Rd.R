library(smoothROCtime)


### Name: stRoc
### Title: Smooth Time-dependent ROC curve estimations
### Aliases: stRoc

### ** Examples

library(smoothROCtime)
require(KMsurv)

data(kidtran)

# Preparing data: a logarithmic transformation of the time-to-event variable is made
  DT <- cbind(log(kidtran$time),kidtran$delta,kidtran$age)

# Point of Time
  t5 <- log(5*365.25) # five years in logarithm scale

# Cumulative/dynamic ROC curve estimation
  rcd <- stRoc(data=DT, t=t5, bw="Hpi", tcr="C", meth=2)

# Plot graphic
  plot(rcd$p, rcd$ROC, type="l", lwd=5, main="C/D ROC",xlab="FPR",ylab="TPR")
  lines(c(0,1),c(0,1),lty=2,col="gray")




