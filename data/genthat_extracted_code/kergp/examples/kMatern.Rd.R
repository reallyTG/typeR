library(kergp)


### Name: kMatern
### Title: Matérn Kernels
### Aliases: kMatern kExp

### ** Examples

kMatern()  # default: d = 1, nu = 5/2
kMatern(d = 2)
myMatern <- kMatern(d = 5, nu = "3/2")
coef(myMatern) <- c(range = 1:5, sigma2 = 0.1)
myMatern
try(kMatern(nu = 2))  # error



