library(PMCMR)


### Name: posthoc.durbin.test
### Title: Posthoc Durbin test
### Aliases: posthoc.durbin.test posthoc.durbin.test.default
### Keywords: htest nonparametric

### ** Examples

## Example for an incomplete block design:
## Data from Conover (1999, p. 391).
y <- matrix(c(
2,NA,NA,NA,3, NA,  3,  3,  3, NA, NA, NA,  3, NA, NA,
  1,  2, NA, NA, NA,  1,  1, NA,  1,  1,
NA, NA, NA, NA,  2, NA,  2,  1, NA, NA, NA, NA,
  3, NA,  2,  1, NA, NA, NA, NA,  3, NA,  2,  2
), ncol=7, nrow=7, byrow=FALSE,
dimnames=list(1:7, LETTERS[1:7]))
y
durbin.test(y)
posthoc.durbin.test(y, p.adj="none")

## Example for a complete block design:
## Sachs, 1997, p. 675
## Six persons (block) received six different diuretics (A to F, treatment).
## The responses are the Na-concentration (mval)
## in the urine measured 2 hours after each treatment.
##
y <- matrix(c(
3.88, 5.64, 5.76, 4.25, 5.91, 4.33, 30.58, 30.14, 16.92,
23.19, 26.74, 10.91, 25.24, 33.52, 25.45, 18.85, 20.45, 
26.67, 4.44, 7.94, 4.04, 4.4, 4.23, 4.36, 29.41, 30.72,
32.92, 28.23, 23.35, 12, 38.87, 33.12, 39.15, 28.06, 38.23,
26.65),nrow=6, ncol=6, 
dimnames=list(1:6,LETTERS[1:6]))
print(y)
friedman.test(y)
durbin.test(y)
posthoc.durbin.test(y, p.adj="none")
posthoc.friedman.conover.test(y, p.adj="none")



