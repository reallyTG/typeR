library(mixR)


### Name: density.mixfitEM
### Title: The Density of Finite Mixture Models
### Aliases: density.mixfitEM

### ** Examples

set.seed(102)
x <- rmixnormal(200, c(0.5, 0.5), c(2, 5), c(1, 0.7))
fit1 <- mixfit(x, ncomp = 2)
fit2 <- mixfit(x, ncomp = 2, ev = TRUE)
plot(fit1, detail = FALSE, breaks = 20)
lines(density(fit2), col = "red")




