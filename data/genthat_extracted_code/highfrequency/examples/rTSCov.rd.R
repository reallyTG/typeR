library(highfrequency)


### Name: rTSCov
### Title: Two time scale covariance estimation
### Aliases: rTSCov
### Keywords: volatility

### ** Examples

 # Robust Realized two timescales Variance/Covariance for CTS 
 data(sample_tdata); 
 data(lltc.xts); 
 data(sbux.xts); 
 
 # Univariate: 
 rvTS = rTSCov( pdata = sample_tdata$PRICE); 
 # Note: Prices as input
 rvTS 
 
 # Multivariate:
 rcTS = rTSCov( pdata = list(cumsum(lltc.xts)+100,cumsum(sbux.xts)+100) ); 
 # Note: List of prices as input
 rcTS 



