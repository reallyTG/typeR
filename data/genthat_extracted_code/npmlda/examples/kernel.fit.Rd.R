library(npmlda)


### Name: kernel.fit
### Title: Nadaraya-Watson Kernel estimator
### Aliases: kernel.fit

### ** Examples

X <- seq(0, 1, len=100)
Y <- (X- 0.5)^3 - 2*(X-0.5)^2+ rnorm(100, 0, 0.1)
kernel.fit(seq(0,1,0.1), X, Y, Kernel="Ep", bw=0.1, Wt=1   )



