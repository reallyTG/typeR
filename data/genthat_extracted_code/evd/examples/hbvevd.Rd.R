library(evd)


### Name: hbvevd
### Title: Parametric Spectral Density Functions of Bivariate Extreme Value
###   Models
### Aliases: hbvevd
### Keywords: distribution

### ** Examples

hbvevd(dep = 2.7, model = "hr")
hbvevd(seq(0.25,0.5,0.75), dep = 0.3, asy = c(.7,.9), model = "alog")
hbvevd(alpha = 0.3, beta = 1.2, model = "negbi", plot = TRUE)

bvdata <- rbvevd(100, dep = 0.7, model = "log")
M1 <- fitted(fbvevd(bvdata, model = "log"))
hbvevd(dep = M1["dep"], model = "log", plot = TRUE)



