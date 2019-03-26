library(idr)


### Name: est.IDR
### Title: Estimate the irreproducible discovery rate using the copula
###   mixture model
### Aliases: est.IDR
### Keywords: Statistical Models

### ** Examples

data("simu.idr")

# simu.idr$x and simu.idr$y are p-values
# Transfer them such that large values represent significant ones 
x <- cbind(-simu.idr$x, -simu.idr$y)

mu <- 2.6
sigma <- 1.3
rho <- 0.8
p <- 0.7

idr.out <- est.IDR(x, mu, sigma, rho, p, eps=0.001, max.ite=20)

names(idr.out)



