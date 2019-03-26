library(revdbayes)


### Name: rprior_prob
### Title: Prior simulation of GEV parameters - prior on probability scale
### Aliases: rprior_prob

### ** Examples

quant <- c(85, 88, 95)
alpha <- c(4, 2.5, 2.25, 0.25)
x <- rprior_prob(n = 1000, quant = quant, alpha = alpha, exc = TRUE)
x <- rprior_prob(n = 1000, quant = quant, alpha = alpha, exc = TRUE, lb = 0)



