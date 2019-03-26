library(vfcp)


### Name: vfjoe
### Title: Joe Copula Variable Given Second One and Copula Probability
### Aliases: vfjoe
### Keywords: ~kwd1 ~kwd2

### ** Examples

C <- 0.3
tht <- 6
u <- c(0.35, 0.4, 0.45)
v <- vfjoe(C, u, tht)
kop = joeCopula(tht)
pCopula(cbind(u, v), kop)
#
Cf <- c(0.3, 0.4)
mx <- matrix(c(seq(0.35, 0.45, 0.05), seq(0.5, 0.6, 0.05)),
             nrow = 2, ncol = 3, byrow = TRUE)
rownames(mx) <- Cf
vfjoe(C = Cf, u = mx , tht=6)
#           [,1]      [,2]      [,3]
# [1,] 0.4021216 0.3513741 0.3274672
# [2,] 0.4379531 0.4184746 0.4087143



