library(jmuOutlier)


### Name: quantileCI
### Title: Confidence Intervals on Quantiles
### Aliases: quantileCI
### Keywords: Confidence interval Quantile Population median

### ** Examples

# Sample 20 observations from an Exponential distribution with mean=10.
# Construct 90% confidence intervals on the 25th, 50th, and 75th percentiles.  
x = rexp( 20, 0.1 ) ;   list(sort(x)) ;   quantileCI( x, c( 0.25, 0.5, 0.75 ), 0.9 ) 


