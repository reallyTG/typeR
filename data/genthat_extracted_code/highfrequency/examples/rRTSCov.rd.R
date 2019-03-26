library(highfrequency)


### Name: rRTSCov
### Title: Robust two time scale covariance estimation
### Aliases: rRTSCov
### Keywords: volatility

### ** Examples
 
 # Robust Realized two timescales Variance/Covariance for CTS 
 data(sample_tdata); 
 data(lltc.xts); 
 data(sbux.xts); 
 
 # Univariate: 
 rvRTS = rRTSCov( pdata = sample_tdata$PRICE); 
 # Note: Prices as input
 rvRTS 
 
 # Multivariate:
 rcRTS = rRTSCov( pdata = list(cumsum(lltc.xts)+100,cumsum(sbux.xts)+100) ); 
 # Note: List of prices as input
 rcRTS 



