library(HMMmlselect)


### Name: RobustBIC
### Title: RobustBIC
### Aliases: RobustBIC

### ** Examples

library(HMMmlselect)

# Example 1: use robust BIC to determine the order of HMM
obs = HMMsim ( n = 200 )$obs
resultsBIC = RobustBIC ( y = obs )



