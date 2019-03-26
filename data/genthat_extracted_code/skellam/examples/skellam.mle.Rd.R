library(skellam)


### Name: skellam.mle
### Title: MLE of the Skellam distribution
### Aliases: skellam.mle
### Keywords: Maximum likelihood estimation

### ** Examples

require('skellam')

x1 <- rpois(1000, 10)
x2 <- rpois(1000, 6)
x <- x1 - x2
skellam.mle(x)

x1 <- rpois(10000, 10)
x2 <- rpois(10000, 6)
x <- x1 - x2
skellam.mle(x)



