library(VGAM)


### Name: ruge
### Title: Rutherford-Geiger Polonium Data
### Aliases: ruge
### Keywords: datasets

### ** Examples

lambdahat <- with(ruge, weighted.mean(number, w = counts))
(N <- with(ruge, sum(counts)))
with(ruge, cbind(number, counts,
                 fitted = round(N * dpois(number, lam = lambdahat))))



