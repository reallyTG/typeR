library(umx)


### Name: umxWeightedAIC
### Title: AIC weight-based conditional probabilities.
### Aliases: umxWeightedAIC

### ** Examples

l1 = lm(mpg~ wt + disp, data=mtcars)
l2 = lm(mpg~ wt, data=mtcars)
umxWeightedAIC(models = list(l1, l2))



