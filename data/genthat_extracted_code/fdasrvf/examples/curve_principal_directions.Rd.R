library(fdasrvf)


### Name: curve_principal_directions
### Title: Curve PCA
### Aliases: curve_principal_directions
### Keywords: alignment srvf

### ** Examples

data("mpeg7")
out = curve_srvf_align(beta[,,1,1:2],maxit=2) # note: use more shapes, small for speed
K = curve_karcher_cov(out$betamean, beta[,,1,1:2])
pd = curve_principal_directions(out$betamean, out$q_mu, K)



