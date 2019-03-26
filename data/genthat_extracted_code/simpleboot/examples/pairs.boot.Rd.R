library(simpleboot)


### Name: pairs.boot
### Title: Two sample bootstrap.
### Aliases: pairs.boot
### Keywords: univar

### ** Examples

set.seed(1)
x <- rnorm(100)
y <- 2 * x + rnorm(100)
boot.cor <- pairs.boot(x, y, FUN = cor, R = 1000)
boot.ci(boot.cor)

## With weighting
set.seed(20)
w <- (100:1)^2
bw <- pairs.boot(x, y, FUN = cor, R = 5000, weights = w)
boot.ci(bw, type = c("norm", "basic", "perc"))



