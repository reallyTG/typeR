library(Compositional)


### Name: Quasi binomial regression for proportions
### Title: Quasi binomial regression for proportions
### Aliases: propreg propregs
### Keywords: GLMs Quasi regression fractional response

### ** Examples

y <- rbeta(100, 1, 4)
x <- matrix(rnorm(100 * 3), ncol = 3)
a <- propreg(y, x)
y <- rbeta(100, 1, 4)
x <- matrix(rnorm(400 * 100), ncol = 400)
b <- propregs(y, x)
mean(b[, 2] < 0.05)



