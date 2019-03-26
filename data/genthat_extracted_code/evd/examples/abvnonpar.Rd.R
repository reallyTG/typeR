library(evd)


### Name: abvnonpar
### Title: Non-parametric Estimates for Dependence Functions of the
###   Bivariate Extreme Value Distribution
### Aliases: abvnonpar
### Keywords: nonparametric

### ** Examples

bvdata <- rbvevd(100, dep = 0.7, model = "log")
abvnonpar(seq(0, 1, length = 10), data = bvdata, convex = TRUE)
abvnonpar(data = bvdata, method = "pick", plot = TRUE)

M1 <- fitted(fbvevd(bvdata, model = "log"))
abvevd(dep = M1["dep"], model = "log", plot = TRUE)
abvnonpar(data = bvdata, add = TRUE, lty = 2)



