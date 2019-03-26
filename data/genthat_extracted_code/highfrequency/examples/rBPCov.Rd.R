library(highfrequency)


### Name: rBPCov
### Title: Realized BiPower Covariance
### Aliases: rBPCov
### Keywords: volatility

### ** Examples

 # Realized Bipower Variance/Covariance for CTS aligned   
 # at 5 minutes.
 data(sample_tdata); 
 data(sample_5minprices_jumps);
 
 # Univariate: 
 rbpv = rBPCov( rdata = sample_tdata$PRICE, align.by ="minutes", 
                    align.period =5, makeReturns=TRUE); 
 rbpv 
 
 # Multivariate: 
 rbpc = rBPCov( rdata = sample_5minprices_jumps['2010-01-04'], makeReturns=TRUE,makePsd=TRUE); 
 rbpc



