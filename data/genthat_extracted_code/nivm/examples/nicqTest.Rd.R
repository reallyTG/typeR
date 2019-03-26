library(nivm)


### Name: nicqTest
### Title: Non-inferiority control quantile test
### Aliases: nicqTest
### Keywords: htest

### ** Examples

## if you know that q=0.20 and there are no ties then ic=q*nc=40 
nicqTest(66,g=nimDiffOR,delta0=.1,q=.2,nc=200,nt=300,ic=40,conf.int=FALSE)
## examples with confidence intervals may be slower: see
##  demo(nicqTest.examples)



