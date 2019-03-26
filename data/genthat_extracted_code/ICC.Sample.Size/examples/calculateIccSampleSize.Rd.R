library(ICC.Sample.Size)


### Name: calculateIccSampleSize
### Title: Function to calculate sample size required for studies where ICC
###   is primary outcome.
### Aliases: calculateIccSampleSize

### ** Examples

## Calculate Sample Size for p=0.80, p0=0.60, two ratings, alpha=0.05 with two tails and power=0.80.
calculateIccSampleSize(p=0.80,p0=0.60,k=2,alpha=0.05,tails=2,power=0.80)
## Calculate Sample Size as above, but test varying p from 0 to 1 by steps of 0.05
calculateIccSampleSize(p=0.80,p0=0.60,k=2,alpha=0.05,tails=2,power=0.80,by="p",step=0.05)
## Calculate Sample Size as above, but test varying p0 from 0 to 1 by steps of 0.05
calculateIccSampleSize(p=0.80,p0=0.60,k=2,alpha=0.05,tails=2,power=0.80,by="p0",step=0.05)
## Calculate Sample Size as above, but test varying both p and p0 from 0 to 1 by steps of 0.05
calculateIccSampleSize(p=0.80,p0=0.60,k=2,alpha=0.05,tails=2,power=0.80,by="both",step=0.05)



