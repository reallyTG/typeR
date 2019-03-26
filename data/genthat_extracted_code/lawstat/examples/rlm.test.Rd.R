library(lawstat)


### Name: rlm.test
### Title: Robust L1 Moment-Based (RLM) Goodness-of-Fit Test for the
###   Laplace Distribution
### Aliases: rlm.test
### Keywords: htest

### ** Examples

## Laplace distributed data
x = rexp(100)-rexp(100)
rlm.test(x)

## Sample Output
##
##        Robust L1 moment-based goodness-of-fit test using a Chi-squared approximated 
##        critical values
##
## data:  x
## Chi-squared statistic = 0.3945, df = 2, p-value = 0.821




