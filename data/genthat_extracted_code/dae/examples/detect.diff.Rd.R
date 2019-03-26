library(dae)


### Name: detect.diff
### Title: Computes the detectable difference for an experiment
### Aliases: detect.diff
### Keywords: design

### ** Examples

## Compute the detectable difference for a randomized complete block design 
## with four treatments given power is 0.8 and alpha is 0.05. 
rm <- 5
detect.diff(rm = rm, df.num = 3, df.denom = 3 * (rm - 1),sigma = sqrt(20))



