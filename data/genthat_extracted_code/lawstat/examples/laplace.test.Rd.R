library(lawstat)


### Name: laplace.test
### Title: Goodness-of-fit tests for the Laplace distribution
### Aliases: laplace.test
### Keywords: htest

### ** Examples


## Differences in flood levels example taken from Puig and Stephens (2000)
library(VGAM)
y<-c(1.96,1.97,3.60,3.80,4.79,5.66,5.76,5.78,6.27,6.30,6.76,7.65,7.84,7.99,8.51,9.18,
10.13,10.24,10.25,10.43,11.45,11.48,11.75,11.81,12.33,12.78,13.06,13.29,13.98,14.18,
14.40,16.22,17.06)
laplace.test(y)$D

## [1] 0.9177726
## The critical value at the 0.05 significance level is approximately 0.906.
## Thus, the null hypothesis would be rejected at the 0.05 level.
## For the tables of critical values, see Stephens (1986) or Puig and Stephens (2000).




