library(evd)


### Name: qcbvnonpar
### Title: Non-parametric Estimates for Bivariate Quantile Curves
### Aliases: qcbvnonpar
### Keywords: nonparametric

### ** Examples

bvdata <- rbvevd(100, dep = 0.7, model = "log")
qcbvnonpar(c(0.9,0.95), data = bvdata, plot = TRUE)
qcbvnonpar(c(0.9,0.95), data = bvdata, epmar = TRUE, plot = TRUE)



