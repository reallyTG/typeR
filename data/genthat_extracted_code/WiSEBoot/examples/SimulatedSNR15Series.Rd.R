library(WiSEBoot)


### Name: SimulatedSNR15Series
### Title: Simulated Wavelet Signals with SNR=15
### Aliases: SimulatedSNR15Series
### Keywords: datasets

### ** Examples

data(SimulatedSNR15Series)

##See if WiSEBoot selects the correct threshold for this data (J0=3)
## R=10 bootstrap samples is not recommended.  For demonstration only.
bootObj <- WiSEBoot(SimulatedSNR15Series[,4], R=10)
bootObj$MSECriteria

##Look at the noisy data compared to the true smooth
data(SimulatedSmoothSeries)
plot(seq(1, 2^10), SimulatedSNR15Series[ , 6], main="Threshold of J0=5", 
     col="lightgray", xlab="Time", ylab="Observations", type="l")
lines(seq(1, 2^10), SimulatedSmoothSeries[ ,6], col="red", lwd=2)



