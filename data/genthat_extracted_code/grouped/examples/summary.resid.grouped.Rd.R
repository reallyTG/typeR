library(grouped)


### Name: summary.resid.grouped
### Title: Summary method for resid.grouped objects
### Aliases: summary.resid.grouped
### Keywords: methods

### ** Examples


m <- grouped(cbind(lo, up) ~ treat * x, link = "logit", data = Sdata)
summary(resid(m, TRUE))




