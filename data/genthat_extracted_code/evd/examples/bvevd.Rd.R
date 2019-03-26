library(evd)


### Name: bvevd
### Title: Parametric Bivariate Extreme Value Distributions
### Aliases: dbvevd pbvevd rbvevd
### Keywords: distribution

### ** Examples

pbvevd(matrix(rep(0:4,2), ncol=2), dep = 0.7, model = "log")
pbvevd(c(2,2), dep = 0.7, asy = c(0.6,0.8), model = "alog")
pbvevd(c(1,1), dep = 1.7, model = "hr")

margins <- cbind(0, 1, seq(-0.5,0.5,0.1))
rbvevd(11, dep = 1.7, model = "hr", mar1 = margins)
rbvevd(10, dep = 1.2, model = "neglog", mar1 = c(10, 1, 1))
rbvevd(10, alpha = 0.7, beta = 0.52, model = "bilog")

dbvevd(c(0,0), dep = 1.2, asy = c(0.5,0.9), model = "aneglog")
dbvevd(c(0,0), alpha = 0.75, beta = 0.5, model = "ct", log = TRUE)
dbvevd(c(0,0), alpha = 0.7, beta = 1.52, model = "negbilog")



