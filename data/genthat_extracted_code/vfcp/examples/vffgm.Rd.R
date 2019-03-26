library(vfcp)


### Name: vffgm
### Title: Farlie-Gumbel-Morgenstern Copula Variable Given Second One and
###   Copula Probability
### Aliases: vffgm
### Keywords: ~kwd1 ~kwd2

### ** Examples

require(copula)
C = 0.3
tht = 0.5
u = c(0.35, 0.40, 0.45)
v <- vffgm(C, u, tht)
kfgm <- fgmCopula(tht)
pCopula(c(u, v), kfgm)
#
Cf <- c(0.3, 0.4)
mx <- matrix(c(seq(0.35, 0.45, 0.05), seq(0.5, 0.6, 0.05)),
             nrow = 2, ncol = 3, byrow = TRUE)
rownames(mx) <- Cf
vffgm(C = Cf, u = mx , tht=0.5)
#          [,1]      [,2]      [,3]
# 0.3 0.8064052 0.6853009 0.6007056
# 0.4 0.7535751 0.6781648 0.6195239



