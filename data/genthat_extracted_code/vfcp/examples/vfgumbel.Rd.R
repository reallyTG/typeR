library(vfcp)


### Name: vfgumbel
### Title: Gumbel Copula Variable Given Second One and Copula Probability
### Aliases: vfgumbel
### Keywords: ~kwd1 ~kwd2

### ** Examples

C <- 0.3
tht <- 6
u <- c(0.35, 0.4, 0.45)
v <- vfgumbel(C, u, tht)
kop = gumbelCopula(tht)
pCopula(cbind(u, v), kop)
#
vfgumbel(c(0.3, 0.4), u = rbind(seq(0.35, 0.45, 0.05),
  seq(0.45, 0.55, 0.05)), 8)
#           [,1]      [,2]      [,3]
# [1,] 0.3184504 0.3053987 0.3017235
# [2,] 0.4184819 0.4051936 0.4015295



