library(idr)


### Name: idr-package
### Title: Irreproducible discovery rate
### Aliases: idr-package idr
### Keywords: package

### ** Examples


data("simu.idr")
x <- cbind(-simu.idr$x, -simu.idr$y)

mu <- 2.6
sigma <- 1.3
rho <- 0.8
p <- 0.7

idr.out <- est.IDR(x, mu, sigma, rho, p, eps=0.001, max.ite=20)

names(idr.out)



