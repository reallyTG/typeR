library(highfrequency)


### Name: rHYCov
### Title: Hayashi-Yoshida Covariance
### Aliases: rHYCov
### Keywords: volatility

### ** Examples

 # Average Realized Kernel Variance/Covariance for CTS aligned at one minute returns at 
 # 5 subgrids (5 minutes).
 data(lltc.xts); 
 data(sbux.xts); 
  # Multivariate:
 rHYCov = rHYCov( rdata = list(lltc.xts,sbux.xts), period = 5, align.by ="minutes", 
                   align.period=5, makeReturns=FALSE); 
 rHYCov 
 #Note: for the diagonal elements the rCov is used.



