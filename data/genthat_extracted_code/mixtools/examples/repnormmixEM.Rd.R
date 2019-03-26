library(mixtools)


### Name: repnormmixEM
### Title: EM Algorithm for Mixtures of Normals with Repeated Measurements
### Aliases: repnormmixEM
### Keywords: file

### ** Examples

## EM output for the water-level task data set.

data(Waterdata)
set.seed(100)
water <- t(as.matrix(Waterdata[,3:10]))
em.out <- repnormmixEM(water, k = 2, verb = TRUE, epsilon = 1e-03)
em.out



