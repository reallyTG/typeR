library(skellam)


### Name: skellam.reg
### Title: Regression assuming a Skellam distribution
### Aliases: skellam.reg
### Keywords: Skellam regression

### ** Examples

require('skellam')

set.seed(0)

x <- rnorm(1000)
y1 <- rpois(1000, exp(1 + 1 * x) )
y2 <- rpois(1000 , exp(-1 + 1 * x) )
y <- y2 - y1
skellam.reg(y, x)



