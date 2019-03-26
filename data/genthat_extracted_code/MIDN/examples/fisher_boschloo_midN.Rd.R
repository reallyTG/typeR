library(MIDN)


### Name: fisher_boschloo_midN
### Title: Nearly exact sample size calculation for the Fisher-Boschloo
###   test for differences between independent binomial proportions
### Aliases: fisher_boschloo_midN
### Keywords: binomial two-sample problem Boschloo's approach exact
###   Fisher-type test

### ** Examples


result1 <- fisher_boschloo_midN(0.025,0.0001,0.95,0.8,0.8,2,1)
POWEX <- result1[5]
result1  # shows values of vector result1
POWEX    # shows value of POWEX




