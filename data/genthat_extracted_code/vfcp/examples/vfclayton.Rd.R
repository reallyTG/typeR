library(vfcp)


### Name: vfclayton
### Title: Clayton Copula Variable Given Second One and Copula Probability
### Aliases: vfclayton
### Keywords: ~kwd1 ~kwd2

### ** Examples

C <- 0.3
tht <- 6
u <- c(0.35, 0.4, 0.45)
v <- vfclayton(C, u, tht)
kop = claytonCopula(tht)
pCopula(cbind(u, v), kop)
#
Cf <- c(0.3, 0.4)
mx <- matrix(c(seq(0.35, 0.45, 0.05), seq(0.5, 0.6, 0.05)),
  nrow = 2, ncol = 3, byrow = TRUE)
rownames(mx) <- Cf
vfclayton(C = Cf, u = mx , tht=7)
#          [,1]      [,2]      [,3]
# 0.3 0.3183261 0.3061926 0.3025859
# 0.4 0.4135555 0.4064530 0.4033610



