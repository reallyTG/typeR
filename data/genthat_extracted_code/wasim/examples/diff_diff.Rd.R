library(wasim)


### Name: diff_diff
### Title: Count time steps with wrong direction in dynamics
### Aliases: diff_diff
### Keywords: utilities

### ** Examples

   data(models_dawson,package="wasim")
   diff_diff(models_dawson[,1],models_dawson[,2])

   do.call(rbind,lapply(models_dawson, FUN =diff_diff, y=models_dawson[,1]))




