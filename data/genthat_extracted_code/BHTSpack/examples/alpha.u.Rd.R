library(BHTSpack)


### Name: alpha.u
### Title: package internal function
### Aliases: alpha.u

### ** Examples

  M = 5
  H = 10
  a = 10^-6
  b = 10^-6
  nu = lapply(1:M, function(x){rbeta(H, a, b)})
  alpha.u(nu, a, b, H)



