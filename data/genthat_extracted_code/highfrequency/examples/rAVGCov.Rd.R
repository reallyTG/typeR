library(highfrequency)


### Name: rAVGCov
### Title: Realized Covariance: Average Subsample
### Aliases: rAVGCov
### Keywords: volatility

### ** Examples
 
 # Average subsampled realized variance/covariance for CTS aligned at one minute returns at 
 # 5 subgrids (5 minutes).
 data(sample_tdata); 
 data(lltc.xts);
 data(sbux.xts);
 
 # Univariate
 rvSub = rAVGCov( rdata = sample_tdata$PRICE, period = 5, align.by ="minutes", 
                   align.period=5, makeReturns=TRUE); 
 rvSub
 
 # Multivariate:
 rcSub = rAVGCov( rdata = list(lltc.xts,sbux.xts), period = 5, align.by ="minutes", 
                   align.period=5, makeReturns=FALSE); 
 rcSub



