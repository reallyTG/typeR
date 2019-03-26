library(jmuOutlier)


### Name: plotCI
### Title: Confidence Interval Plot
### Aliases: plotCI
### Keywords: Confidence interval

### ** Examples

# Plot 50 90%confidence intervals, each based on 13 observations from a 
#    Normal( mean=70, sd=10 ) distribution.
CI = replicate( 50, CI.t.test( rnorm( 13, 70, 10 ), 0.9 ) )
plotCI( CI, 70 )



