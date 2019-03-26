library(MIDN)


### Name: MIDN-package
### Title: Nearly exact sample size calculation for exact powerful
###   nonrandomized tests for differences between binomial proportions
### Aliases: MIDN-package MIDN

### ** Examples

result1 <- fisher_boschloo_midN(0.025,0.0001,0.95,0.8,0.8,2,1)
POWEX <- result1[5]
result1  # shows values of vector result1
POWEX    # shows value of POWEX

result2 <- McNem_Score_midn(0.025,0.0001,0.585,0.315,0.9)
POWEX <- result2[3]
result2  # shows values of vector result2
POWEX    # shows value of POWEX



