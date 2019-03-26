library(HMMmlselect)


### Name: HMMfit
### Title: HMMfit
### Aliases: HMMfit

### ** Examples

library(HMMmlselect)

# Example 1: use HMMfit to inference number of states
obs = HMMsim ( n = 200 )$obs
Nest = HMMfit( y = obs, K=3, METHOD = 1)



