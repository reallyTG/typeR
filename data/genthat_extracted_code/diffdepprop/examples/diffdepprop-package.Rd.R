library(diffdepprop)


### Name: diffdepprop-package
### Title: Calculates Confidence Intervals for two Dependent Proportions
### Aliases: diffdepprop-package diffdepprop

### ** Examples

# a=10, b=15, c=5, d=20, n=50, type I error is 0.05
wilson = wilson(10,15,5,20,50,0.05)
# b=15, c=5, n=50, type I error is 0.05
exact.cond = exact.cond(15, 5, 50, 0.05)



