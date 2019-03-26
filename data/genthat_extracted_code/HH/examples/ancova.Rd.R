library(HH)


### Name: ancova
### Title: Compute and plot oneway analysis of covariance
### Aliases: ancova 'analysis of covariance' covariance anova.ancova
###   predict.ancova print.ancova model.frame.ancova summary.ancova
###   plot.ancova coef.ancova panel.ancova
### Keywords: hplot dplot models regression

### ** Examples

data(hotdog)

## y ~ x                     ## constant line across all groups
ancova(Sodium ~ Calories,     data=hotdog, groups=Type)

## y ~ a                     ## different horizontal line in each group
ancova(Sodium ~            Type, data=hotdog, x=Calories)

## This is the usual usage
## y ~ x + a  or  y ~ a + x  ## constant slope, different intercepts
ancova(Sodium ~ Calories + Type, data=hotdog)
ancova(Sodium ~ Type + Calories, data=hotdog)

## y ~ x * a  or  y ~ a * x  ## different slopes, and different intercepts
ancova(Sodium ~ Calories * Type, data=hotdog)
ancova(Sodium ~ Type * Calories, data=hotdog)

## y ~ a * x ## save the object and print the trellis graph
hotdog.ancova <- ancova(Sodium ~ Type * Calories, data=hotdog)
attr(hotdog.ancova, "trellis")


## label points in the panels by the value of the block factor
data(apple)
ancova(yield ~ treat + pre, data=apple, blocks=block)

## Please see
##      demo("ancova")
## for a composite graph illustrating the four models listed above.



