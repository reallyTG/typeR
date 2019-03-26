library(revdbayes)


### Name: rprior_quant
### Title: Prior simulation of GEV parameters - prior on quantile scale
### Aliases: rprior_quant

### ** Examples

pr <- 10 ^ -(1:3)
sh <- c(38.9, 7.1, 47)
sc <- c(1.5, 6.3, 2.6)
x <- rprior_quant(n = 1000, prob = pr, shape = sh, scale = sc)
x <- rprior_quant(n = 1000, prob = pr, shape = sh, scale = sc, lb = 0)



