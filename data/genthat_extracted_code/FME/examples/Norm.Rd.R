library(FME)


### Name: Norm
### Title: Normal Random Distribution
### Aliases: Norm
### Keywords: utilities

### ** Examples

## multinormal parameters: variance-covariance matrix and parameter mean
parCovar <- matrix(data = c(0.5, -0.2, 0.3, 0.4, -0.2, 1.0, 0.1, 0.3,
                   0.3, 0.1, 1.5, -0.7, 1.0, 0.3, -0.7, 4.5), nrow = 4)
parCovar

parMean <- 4:1

## Generated sample
Ndist <- Norm(parCovar = parCovar, parMean = parMean, num = 500)
cov(Ndist)   # check
pairs(Ndist, main = "normal")

## truncated multinormal
Ranges <- data.frame(min = rep(0, 4), max = rep(Inf, 4))

pairs(Norm(parCovar = parCovar, parMean = parMean, parRange = Ranges,
      num = 500), main = "truncated normal")




