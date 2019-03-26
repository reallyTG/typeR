library(rcosmo)


### Name: fmf
### Title: First Minkowski functional
### Aliases: fmf

### ** Examples


n <- 64
cmbdf <- CMBDataFrame(nside=n, I = rnorm(12*n^2),
                      coords = "cartesian",
                      ordering = "nested")
fmf(cmbdf, 0, 4)
fmf(cmbdf, 2, 4)

win <- CMBWindow(theta = c(0,pi/2,pi/2), phi = c(0,0,pi/2))
cmbdf.win <- window(cmbdf, new.window = win)
fmf(cmbdf.win, 0, 4)




