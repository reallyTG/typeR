library(highfrequency)


### Name: MRC
### Title: Modulated Realized Covariance (MRC): Return univariate or
###   multivariate preaveraged estimator.
### Aliases: MRC
### Keywords: highfrequency preaveraging

### ** Examples

data(sample_5minprices_jumps)
a= list (sample_5minprices_jumps["2010-01-04",1], 
         sample_5minprices_jumps["2010-01-04",2] )
MRC(a, pairwise=TRUE,makePsd=TRUE)



