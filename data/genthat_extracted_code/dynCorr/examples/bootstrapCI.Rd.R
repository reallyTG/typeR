library(dynCorr)


### Name: bootstrapCI
### Title: Bootstrap Confidence Interval
### Aliases: bootstrapCI

### ** Examples


## Example 1: using default smoothing parameters, obtain bootstrap CI
##            estimates for all three pairs of responses, for original
##            function only. Note that B=200 or greater should be
##            considered for real data analysis.

examp1.bs <- bootstrapCI(dataFrame = dynCorrData,
                         depVar = c('resp1', 'resp2', 'resp3'),
                         indepVar = 'time',
                         subjectVar = 'subject',
                         points.by = 1,
                         function.choice = c(1,0,0),
                         B = 2, percentile = c(0.025, 0.975), seed = 5)
examp1.bs

## Example 2: using default smoothing parameters, obtain bootstrap CI
##            estimates for all three pairs of responses, for original
##            function only, at -10 days lag, at .01 and .99 percentiles.
##            Note that B=200 or greater should be considered for real
##            data analysis.

examp2.bs <- bootstrapCI(dataFrame = dynCorrData,
                         depVar = c('resp1', 'resp2', 'resp3'),
                         indepVar = 'time',
                         subjectVar = 'subject',
                         points.by = 1,
                         function.choice = c(1,0,0), max.dynCorrLag = -10,
                         B = 2, percentile = c(0.01, 0.99), seed = 7)
examp2.bs




