library(PMCMR)


### Name: posthoc.friedman.conover.test
### Title: Pairwise post-hoc Test for Multiple Comparisons of Rank Sums for
###   Unreplicated Blocked Data (Conover-Test)
### Aliases: posthoc.friedman.conover.test
###   posthoc.friedman.conover.test.default
### Keywords: htest nonparametric

### ** Examples

##
## Sachs, 1997, p. 675
## Six persons (block) received six different diuretics
## (A to F, treatment).
## The responses are the Na-concentration (mval)
## in the urine measured 2 hours after each treatment.
##
y <- matrix(c(
3.88, 5.64, 5.76, 4.25, 5.91, 4.33, 30.58, 30.14, 16.92,
23.19, 26.74, 10.91, 25.24, 33.52, 25.45, 18.85, 20.45, 
26.67, 4.44, 7.94, 4.04, 4.4, 4.23, 4.36, 29.41, 30.72,
32.92, 28.23, 23.35, 12, 38.87, 33.12, 39.15, 28.06, 38.23,
26.65),nrow=6, ncol=6, 
dimnames=list(1:6,c("A","B","C","D","E","F")))
print(y)
friedman.test(y)
posthoc.friedman.conover.test(y=y, p.adjust="none")



