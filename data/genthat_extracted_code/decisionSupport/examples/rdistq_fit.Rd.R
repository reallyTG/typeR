library(decisionSupport)


### Name: rdistq_fit
### Title: Quantiles based univariate random number generation (by
###   parameter fitting).
### Aliases: rdistq_fit

### ** Examples

# Fit a log normal distribution to 3 quantiles:
if ( requireNamespace("rriskDistributions", quietly = TRUE) ){
  percentiles<-c(0.05, 0.5, 0.95)
  quantiles=c(1,3,15)
  hist(r<-rdistq_fit(distribution="lnorm", n=10000, quantiles=quantiles),breaks=100)
  print(quantile(x=r, probs=percentiles))
}



