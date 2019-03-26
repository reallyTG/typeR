library(fdasrvf)


### Name: curve_karcher_cov
### Title: Curve Karcher Covariance
### Aliases: curve_karcher_cov
### Keywords: alignment srvf

### ** Examples

data("mpeg7")
out = curve_srvf_align(beta[,,1,1:2],maxit=2) # note: use more shapes, small for speed
K = curve_karcher_cov(out$betamean, beta[,,1,1:2])



