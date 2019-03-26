library(msu)


### Name: total_correlation
### Title: Estimation of total correlation for a set of categorical random
###   variables.
### Aliases: total_correlation total_correlation C

### ** Examples

total_correlation(list(factor(c(0,1)), factor(c(1,0))), factor(c(0,0)))
total_correlation(list(factor(c('a','b')), factor(c('a','b'))),
    factor(c('a','b')))
## Not run: 
##D total_correlation(list(factor(c(0,1)), factor(c(1,0))), c(0,0))
##D total_correlation(c(factor(c(0,1)), factor(c(1,0))), c(0,0))
## End(Not run)



