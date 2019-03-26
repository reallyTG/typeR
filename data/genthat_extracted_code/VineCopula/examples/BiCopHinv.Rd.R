library(VineCopula)


### Name: BiCopHinv
### Title: Inverse Conditional Distribution Function of a Bivariate Copula
### Aliases: BiCopHinv BiCopHinv1 BiCopHinv2

### ** Examples

# inverse h-functions of the Gaussian copula
cop <- BiCop(1, 0.5)
hi <- BiCopHinv(0.1, 0.2, cop)
## Don't show: 
hi
## End(Don't show)
# or using the fast versions
hi1 <- BiCopHinv1(0.1, 0.2, cop)
hi2 <- BiCopHinv2(0.1, 0.2, cop)
all.equal(hi$hinv1, hi1)
all.equal(hi$hinv2, hi2)

# check if it is actually the inverse
cop <- BiCop(3, 3)
all.equal(0.2, BiCopHfunc1(0.1, BiCopHinv1(0.1, 0.2, cop), cop))
all.equal(0.1, BiCopHfunc2(BiCopHinv2(0.1, 0.2, cop), 0.2, cop))




