library(npmlda)


### Name: NW.WtKernel
### Title: Title Nadaraya-Watson Kernel estimator at x0
### Aliases: NW.WtKernel

### ** Examples

X <- seq(0, 1, len=100)
Y <- (X- 0.5)^3 - 2*(X-0.5)^2+ rnorm(100, 0, 0.1)
NW.WtKernel(X, Y,  X0=0.5, Kernel="Ep", Bndwdth=0.3, Wt=1 )
NW.WtKernel(X, Y,  X0=0.5, Kernel="Nm", Bndwdth=0.3, Wt=1 )



