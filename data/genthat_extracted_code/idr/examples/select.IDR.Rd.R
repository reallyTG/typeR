library(idr)


### Name: select.IDR
### Title: Select observations according to IDR
### Aliases: select.IDR
### Keywords: Statistical Models

### ** Examples


data("simu.idr")
x <- cbind(-simu.idr$x, -simu.idr$y)

mu <- 2.6
sigma <- 1.3
rho <- 0.8
p <- 0.7

idr.out <- est.IDR(x, mu, sigma, rho, p, eps=0.001, max.ite=20)
# select observations exceeding IDR threshold=0.01 
IDR.level <- 0.01
x.selected <- select.IDR(x, idr.out$IDR, IDR.level)



