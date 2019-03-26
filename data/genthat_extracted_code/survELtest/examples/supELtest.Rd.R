library(survELtest)


### Name: supELtest
### Title: The maximally selected EL test
### Aliases: supELtest

### ** Examples

library(survELtest)
nocrossings(threearm[1:30,],group_order=c(3,2,1),sided=1)

## $decision
## [1] 1
## The decision 1 means the case of crossing or alternative orderings is excluded.
## Thus, we can proceed to the one-sided test.

supELtest(threearm[1:30,],group_order=c(3,2,1),sided=1)

## OUTPUT:
## $teststat
## [1] 4.246498
## $critval
## [1] 3.424961
## $pvalue
## [1] 0.026



