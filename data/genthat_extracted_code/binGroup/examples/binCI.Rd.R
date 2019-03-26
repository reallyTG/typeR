library(binGroup)


### Name: binCI
### Title: Confidence Intervals for One Binomial Proportion
### Aliases: binCI binCP binBlaker binSOC binAC binWilson binWald
### Keywords: htest

### ** Examples


# Default method is the two-sided 95% Clopper-Pearson CI:

binCI(n=200, y=10)

# other methods might result in 
# shorter intervals (but asymetric coverage):

binCI(n=200,y=10, method="Blaker")
binCI(n=200,y=10, method="Score")




