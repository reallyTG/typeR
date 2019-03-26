library(APCanalysis)


### Name: apc
### Title: All Possible Comparisons Analysis
### Aliases: apc
### Keywords: design models

### ** Examples

## This example demonstrates the analysis of an artificial data set for a unreplicated 
## factorial design for four two-level factors. The values of "resp" were generated as
## "resp<-round(10+8*x1+5*x3+7*x4+6*x1*x4+rnorm(16), 2)". The data is contained in the 
## data frame "testdata". A maximum model size of 6 and an IER of .05 are used.
apc(resp~x1*x2*x3*x4, maxsize=6, data=testdata, method=1, level=.05, reps=9000)



