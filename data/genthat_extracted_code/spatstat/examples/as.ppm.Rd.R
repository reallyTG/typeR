library(spatstat)


### Name: as.ppm
### Title: Extract Fitted Point Process Model
### Aliases: as.ppm as.ppm.ppm as.ppm.profilepl as.ppm.kppm as.ppm.dppm
### Keywords: spatial models

### ** Examples

   # fit a model by profile maximum pseudolikelihood
   rvals <- data.frame(r=(1:10)/100)
   pfit <- profilepl(rvals, Strauss, cells, ~1)
   # extract the fitted model
   fit <- as.ppm(pfit)



