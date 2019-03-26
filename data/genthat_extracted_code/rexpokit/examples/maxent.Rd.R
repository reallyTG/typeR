library(rexpokit)


### Name: maxent
### Title: Estimating Probabilities via Maximum Entropy: Improved Iterative
###   Scaling
### Aliases: maxent

### ** Examples

# an unbiased 6-sided dice, with mean = 3.5
# what is the probability associated with each side,
# given this constraint?
maxent(3.5, 1:6)

# a biased 6-sided dice, with mean = 4
maxent(4, 1:6)



