library(highfrequency)


### Name: rThresholdCov
### Title: Threshold Covariance
### Aliases: rThresholdCov
### Keywords: volatility

### ** Examples

 # Realized threshold  Variance/Covariance: 
 data(lltc.xts); 
 data(sbux.xts); 
 
 # Multivariate:
 rcThreshold = rThresholdCov(cbind(lltc.xts,sbux.xts), align.by="minutes",align.period=1); 
 rcThreshold  



