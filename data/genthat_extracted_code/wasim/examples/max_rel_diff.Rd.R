library(wasim)


### Name: max_rel_diff
### Title: Calculate the maximum ration of the derivatives of two time
###   series
### Aliases: max_rel_diff
### Keywords: utilities

### ** Examples

   data(models_dawson,package="wasim")
   max_rel_diff(models_dawson[,1],models_dawson[,2])

   do.call(rbind,lapply(models_dawson, FUN =max_rel_diff, y=models_dawson[,1]))




