library(dr)


### Name: dr.permutation.test
### Title: Permutation tests of dimension for dr
### Aliases: dr.permutation.test dr.permutation.test.statistic
### Keywords: regression

### ** Examples

data(ais)
attach(ais)  # the Australian athletes data
#fit dimension reduction regression using sir
m1 <- dr(LBM~Wt+Ht+RCC+WCC, method="sir", nslices = 8)
summary(m1)
dr.permutation.test(m1,npermute=100)
plot(m1)



