library(evd)


### Name: abvevd
### Title: Parametric Dependence Functions of Bivariate Extreme Value
###   Models
### Aliases: abvevd
### Keywords: distribution

### ** Examples

abvevd(dep = 2.7, model = "hr")
abvevd(seq(0,1,0.25), dep = 0.3, asy = c(.7,.9), model = "alog")
abvevd(alpha = 0.3, beta = 1.2, model = "negbi", plot = TRUE)

bvdata <- rbvevd(100, dep = 0.7, model = "log")
M1 <- fitted(fbvevd(bvdata, model = "log"))
abvevd(dep = M1["dep"], model = "log", plot = TRUE)
abvnonpar(data = bvdata, add = TRUE, lty = 2)



