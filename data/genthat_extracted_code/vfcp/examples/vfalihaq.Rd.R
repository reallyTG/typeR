library(vfcp)


### Name: vfalihaq
### Title: Ali-Mikhail-Haq Copula Variable Given Second One and Copula
###   Probability
### Aliases: vfalihaq
### Keywords: ~kwd1 ~kwd2

### ** Examples

require(copula)
C = 0.3
tht = 0.5
u = c(0.35, 0.40, 0.45)
v <- vfalihaq(C, u, tht)
kali <- archmCopula(family = "amh", param = tht, dim = 2)
pCopula(cbind(u, v), kali)
#
Cf <- c(0.3, 0.4)
mx <- matrix(c(seq(0.35, 0.45, 0.05), seq(0.5, 0.6, 0.05)),
             nrow = 2, ncol = 3, byrow = TRUE)
rownames(mx) <- Cf
vfalihaq(C = Cf, u = mx , tht=0.5)
#          [,1]      [,2]      [,3]
# 0.3 0.8019802 0.6774194 0.5918367
# 0.4 0.7500000 0.6739130 0.6153846



