library(rockchalk)


### Name: waldt
### Title: T-test for the difference in 2 regression parameters
### Aliases: waldt

### ** Examples

mdat <- data.frame(x1 = rnorm(100), x2 = rnorm(100))
stde <- 2
mdat$y <- 0.2 * mdat$x1 + 0.24 * mdat$x2 + stde * rnorm(100)
m1 <- lm(y ~ x1 + x2, data = mdat)
waldt("x1", "x2", m1)
waldt("x1", "x2", m1, digits = 2)
## Returned object is not "rounded characters". It is still numbers
stillnumeric <-  waldt("x1", "x2", m1, digits = 2)
stillnumeric
## Equivalent to car package linearHypothesis:
if(require(car)){
    linearHypothesis(m1, "x1 = x2")
}
## recall t = sqrt(F) for a 1 degree of freedom test.
## If we could understand instructions for car, we probably
## would not need this function, actually.



