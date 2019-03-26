library(mixtools)


### Name: repnormmixmodel.sel
### Title: Model Selection in Mixtures of Normals with Repeated Measures
### Aliases: repnormmixmodel.sel
### Keywords: file

### ** Examples

## Assessing the number of components for the water-level task data set.

data(Waterdata)
water<-t(as.matrix(Waterdata[,3:10]))
set.seed(100)
out <- repnormmixmodel.sel(water, k = 3, epsilon = 5e-01)
out



