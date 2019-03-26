library(mistr)


### Name: q.mixdist
### Title: Quantile Function of a Mixture Model
### Aliases: q.mixdist

### ** Examples

DM <- mixdist(3*binomdist(12, 0.4), -2*poisdist(2)+12, weights=c(0.5, 0.5))
y <- c(0.4, p(DM, c(5, 10, 15, 18)), 0.95)
x <- q(DM, y)
plot(DM, which = "cdf", only_mix=TRUE, xlim1 = c(0, 37))
points(x, y)



