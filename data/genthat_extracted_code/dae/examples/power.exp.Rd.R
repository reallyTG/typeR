library(dae)


### Name: power.exp
### Title: Computes the power for an experiment
### Aliases: power.exp
### Keywords: design

### ** Examples

## Compute power for a randomized complete block design with four treatments 
## and five blocks. 
rm <- 5
power.exp(rm = rm, df.num = 3, df.denom = 3 * (rm - 1), delta = 5,
          sigma = sqrt(20),print = TRUE)



