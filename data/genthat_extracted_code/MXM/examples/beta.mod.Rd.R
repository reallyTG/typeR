library(MXM)


### Name: Beta regression
### Title: Beta regression
### Aliases: beta.mod
### Keywords: Regression model beta distribution

### ** Examples

y <- rbeta(500, 3, 5)
x <- matrix( rnorm(500 * 2), ncol = 2)
a1 <- beta.mod(y, x)
w <- runif(500)
a2 <- beta.mod(y, x, w)



