library(WiSEBoot)


### Name: SimulatedSNR9Series
### Title: Simulated Wavelet Signals with SNR=9
### Aliases: SimulatedSNR9Series
### Keywords: datasets

### ** Examples

data(SimulatedSNR9Series)

##See if WiSEBoot selects the correct threshold for this data (J0=3)
## R=10 bootstrap samples is not recommended.  For demonstration only.
bootObj <- WiSEBoot(SimulatedSNR9Series[,4], R=10)
bootObj$MSECriteria

##Look at the noisy data compared to the true smooth
data(SimulatedSmoothSeries)
plot(seq(1, 2^10), SimulatedSNR9Series[ , 6], main="Threshold of J0=5", 
     col="lightgray", xlab="Time", ylab="Observations", type="l")
lines(seq(1, 2^10), SimulatedSmoothSeries[ ,6], col="red", lwd=2)



