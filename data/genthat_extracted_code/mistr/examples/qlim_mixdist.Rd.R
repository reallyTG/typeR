library(mistr)


### Name: qlim.discrmixdist
### Title: Right-Hand Limit of Mixture Quantile Function
### Aliases: qlim.discrmixdist qlim.contdiscrmixdist qlim.contmixdist

### ** Examples

# q() of a negative transformed random variable uses qlim()
DM <- mixdist(3*binomdist(12,0.4), -2*poisdist(2)+12, weights=c(0.5, 0.5))
y <- c(0.05, 0.4, p(-DM, c(-5, -10, -15, -18)), 0.95)
x <- q(-DM, y)
plot(-DM, which = "cdf", only_mix=TRUE, xlim1 = c(-37, 0))
points(x, y)



