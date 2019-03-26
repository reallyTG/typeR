library(rateratio.test)


### Name: rateratio.test
### Title: An Exact Rate Ratio Test Assuming Poisson Counts
### Aliases: rateratio.test
### Keywords: htest

### ** Examples

### p values and confidence intervals are defined the same way
### so there is consistency in inferences
rateratio.test(c(2,9),c(17877,16660))
### Small counts and large time values will give results similar to Fisher's exact test 
### since in that case the rate ratio is  approximately equal to the odds ratio 
### However, for the Fisher's exact test, the two-sided p-value is defined differently from 
###  the way the confidence intervals are defined and may imply different inferences
### i.e., p-value may say reject OR=1, but confidence interval says not to reject OR=1
fisher.test(matrix(c(2,9,17877-2,16660-9),2,2))



