library(BlakerCI)


### Name: binom.blaker.VHadj.limits
### Title: Vos-Hudson adjustment of Blaker's binomial confidence limits
### Aliases: binom.blaker.VHadj.limits
### Keywords: htest

### ** Examples

binom.blaker.VHadj.limits(6,13) # [1] 0.2150187 0.7395922

## Note that the lower limit differs from the 
## unadjusted version:

binom.blaker.limits(6,13)       # [1] 0.2158050 0.7395922

## The (unadjusted) lower limit was replaced with the
## Blaker's lower limit (both unadjusted and adjusted) 
## assigned to 7 successes in 15 trials:

binom.blaker.limits(7,15)       # [1] 0.2150187 0.7096627
binom.blaker.VHadj.limits(7,15) # [1] 0.2150187 0.7096627

## The adjustment avoids a contradiction between
## inferences corresponding to
## 6 successes in 13 trials, and 7 successess in 15 trials: 
## Though the latter situation means a higher succes proportion
## in a higher number of trials, it is assigned a smaller
## (unadjusted) Blaker's 95% lower confidence limit. 



