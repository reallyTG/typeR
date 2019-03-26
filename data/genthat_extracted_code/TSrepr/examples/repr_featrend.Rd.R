library(TSrepr)


### Name: repr_featrend
### Title: FeaTrend representation of time series
### Aliases: repr_featrend

### ** Examples

# default settings
repr_featrend(rnorm(50), maxC)

# compute FeaTrend for 4 pieces and make more smoothed ts by order = 8
repr_featrend(rnorm(50), sumC, 4, 8)




