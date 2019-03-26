library(vfcp)


### Name: vffrank
### Title: Frank Copula Variable Given Second One and Copula Probability
### Aliases: vffrank
### Keywords: ~kwd1 ~kwd2

### ** Examples

C <- 0.3
tht <- 6
u <- c(0.35, 0.4, 0.45)
v <- vffrank(C, u, tht)
kop = frankCopula(tht)
pCopula(cbind(u, v), kop)



