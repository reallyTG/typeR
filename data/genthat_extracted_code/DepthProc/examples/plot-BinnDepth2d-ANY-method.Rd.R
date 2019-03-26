library(DepthProc)


### Name: plot,BinnDepth2d,ANY-method
### Title: 2d Binning plot
### Aliases: plot,BinnDepth2d,ANY-method
### Keywords: depth function multivariate nonparametric robust

### ** Examples


tmp <- binningDepth2D(x = mvrnorm(100, rep(0, 2), diag(2)))
plot(tmp)




