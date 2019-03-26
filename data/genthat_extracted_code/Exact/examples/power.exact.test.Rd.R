library(Exact)


### Name: power.exact.test
### Title: Power calculation for unconditional exact test
### Aliases: power.exact.test
### Keywords: Power Barnard Boschloo Unconditional Exact Tests

### ** Examples

power.exact.test(0.20, 0.80, 10, 20)
power.exact.test(0.20, 0.80, 10, 20, method="Fisher")
set.seed(218461)
power.exact.test(0.20, 0.80, 10, 20, interval=TRUE, method="Boschloo",
                 simulation=TRUE, nsim=100)



