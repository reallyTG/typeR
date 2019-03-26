library(highfrequency)


### Name: rCov
### Title: Realized Covariance
### Aliases: rCov
### Keywords: volatility

### ** Examples

 # Realized Variance/Covariance for CTS aligned   
 # at 5 minutes.
 data(sample_tdata); 
 data(sample_5minprices_jumps);
 
 # Univariate: 
 rv = rCov( rdata = sample_tdata$PRICE, align.by ="minutes", 
                    align.period =5, makeReturns=TRUE); 
 rv 
 
 # Multivariate: 
 rc = rCov( rdata = sample_5minprices_jumps['2010-01-04'], makeReturns=TRUE); 
 rc



