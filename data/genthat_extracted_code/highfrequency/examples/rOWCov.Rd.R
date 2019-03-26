library(highfrequency)


### Name: rOWCov
### Title: Realized Outlyingness Weighted Covariance
### Aliases: rOWCov
### Keywords: volatility

### ** Examples

 # Realized Outlyingness Weighted Variance/Covariance for CTS aligned   
 # at 5 minutes.
 data(sample_tdata); 
 data(sample_5minprices_jumps);
 
 # Univariate: 
 rvoutw = rOWCov( rdata = sample_tdata$PRICE, align.by ="minutes", 
                    align.period =5, makeReturns=TRUE); 
 rvoutw 
 
 # Multivariate: 
 rcoutw = rOWCov( rdata = sample_5minprices_jumps['2010-01-04'], makeReturns=TRUE); 
 rcoutw



