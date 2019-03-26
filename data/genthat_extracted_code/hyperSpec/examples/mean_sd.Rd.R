library(hyperSpec)


### Name: mean_sd,numeric-method
### Title: Mean and Standard Deviation Calculate mean and standard
###   deviation, and mean, mean +- one standard deviation, respectively.
### Aliases: mean_sd,numeric-method mean_sd mean_sd,matrix-method
###   mean_sd,hyperSpec-method mean_pm_sd,numeric-method mean_pm_sd
###   mean_pm_sd,matrix-method mean_pm_sd,hyperSpec-method
###   mean,hyperSpec-method quantile,hyperSpec-method
### Keywords: multivar univar

### ** Examples


mean_sd (flu [,, 405 ~ 410])

mean_sd (flu$spc)

mean_sd (flu)

  mean_pm_sd (flu$c)

mean_pm_sd (flu$spc)

mean_pm_sd (flu)

plot (mean (chondro))

plot (quantile (chondro))



