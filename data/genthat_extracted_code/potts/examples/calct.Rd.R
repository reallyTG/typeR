library(potts)


### Name: calc_t
### Title: Calculate Canonical Statistic for Potts Model
### Aliases: calc_t calc_t_innergrid calc_t_full
### Keywords: misc

### ** Examples


ncolor <- 4
beta   <- log(1+sqrt(ncolor))
theta  <- c(rep(0,ncolor), beta)

nrow <- 32
ncol <- 32

x <- matrix(sample(ncolor, nrow*ncol, replace=TRUE), nrow=nrow, ncol=ncol)
foo <- packPotts(x, ncolor)
out <- potts(foo, theta, nbatch=10)
x <- unpackPotts(out$final)

t_stat <- calc_t(x, ncolor)
t_stat_inner <- calc_t(x, ncolor, matrix(1, nrow=2, ncol=2), 1, 1)




