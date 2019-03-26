library(gsl)


### Name: Zeta
### Title: Zeta functions
### Aliases: Zeta zeta_int zeta zetam1_int zetam1 hzeta eta_int eta
### Keywords: array

### ** Examples


n <- 1:10
cbind(n,zeta(n),eta(n))   #table 23.3, p 811


zeta_int(1:5)
zeta(c(pi,pi*2))
zetam1_int(1:5)
zetam1(c(pi,pi*2))
hzeta(1.1,1.2)
eta_int(1:5)
eta(c(pi,pi*2))




