library(zyp)


### Name: zyp.trend.vector
### Title: zyp.trend.vector
### Aliases: zyp.trend.vector zyp.zhang zyp.yuepilon
### Keywords: ts robust

### ** Examples

# Without confidence intervals, using the wrapper routine
d <- zyp.trend.vector(c(0, 1, 3, 4, 2, 5), method="yuepilon", conf.intervals=FALSE)

# With confidence intervals, using the wrapper routine
d <- zyp.trend.vector(c(0, 1, 3, 4, 2, 5), method="yuepilon")

# With confidence intervals, not using the wrapper routine
d.zhang <- zyp.zhang(c(0, 1, 3, 4, 2, 5))
d.yuepilon <- zyp.yuepilon(c(0, 1, 3, 4, 2, 5))

# With confidence intervals, with time data.
t.dat <- c(0, 0.3, 1, 3, 3.4, 6)
d <- zyp.trend.vector(c(0, 1, 3, 4, 2, 5), t.dat, method="yuepilon")
d.zhang <- zyp.zhang(c(0, 1, 3, 4, 2, 5), t.dat)
d.yuepilon <- zyp.yuepilon(c(0, 1, 3, 4, 2, 5), t.dat)



