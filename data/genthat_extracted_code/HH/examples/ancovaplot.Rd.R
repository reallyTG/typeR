library(HH)


### Name: ancovaplot
### Title: Analysis of Covariance Plots
### Aliases: ancovaplot ancovaplot.formula panel.ancova.superpose
### Keywords: hplot dplot models regression

### ** Examples

  data(hotdog, package="HH")
  ancovaplot(Sodium ~ Calories + Type, data=hotdog)
  ancovaplot(Sodium ~ Calories * Type, data=hotdog)
  ancovaplot(Sodium ~ Calories, groups=Type, data=hotdog)
  ancovaplot(Sodium ~ Type, x=Calories, data=hotdog)

  ## Please see demo("ancova", package="HH") to coordinate placement
  ## of all four of these plots on the same page.

  ancovaplot(Sodium ~ Calories + Type, data=hotdog, plot.resids=TRUE)




