library(bootruin)


### Name: pvaldens
### Title: Density Estimation of Data in the Unit Interval
### Aliases: pvaldens
### Keywords: dgraph distribution univar

### ** Examples

require(graphics)

x <- rbeta(100, 2, 5)
fhat <- pvaldens(x, rho = 0.9, method = "jh")

hist(x, freq = FALSE, xlim = c(0, 1))
curve(fhat(x), from = 0, to = 1, add = TRUE, col = 2)
box()



