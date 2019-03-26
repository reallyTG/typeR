library(mpt)


### Name: vcov.mpt
### Title: Covariance and Information Matrix for MPT Models
### Aliases: vcov.mpt
### Keywords: models

### ** Examples

data(retroact)
 
mpt1 <- mpt(mptspec(
  c*r,
  (1 - c)*u^2,
  2*(1 - c)*u*(1 - u),
  c*(1 - r) + (1 - c)*(1 - u)^2,
  u,
  1 - u
), retroact[retroact$lists == 1,])

vcov(mpt1)                   # covariance matrix (probability scale)
vcov(mpt1, logit = TRUE)     # covariance matrix (logit scale)
vcov(mpt1, what = "fisher")  # Fisher information



