library(highfrequency)


### Name: rKernelCov
### Title: Realized Covariance: Kernel
### Aliases: rKernelCov
### Keywords: volatility

### ** Examples
 
 # Average Realized Kernel Variance/Covariance for CTS aligned at one minute returns at 
 # 5 subgrids (5 minutes).
 data(sample_tdata); 
 data(lltc.xts); 
 data(sbux.xts); 
 
 # Univariate: 
 rvKernel = rKernelCov( rdata = sample_tdata$PRICE, period = 5, align.by ="minutes", 
                   align.period=5, makeReturns=TRUE); 
 rvKernel 
 
 # Multivariate:
 rcKernel = rKernelCov( rdata = list(lltc.xts,sbux.xts), period = 5, align.by ="minutes", 
                   align.period=5, makeReturns=FALSE); 
 rcKernel 



