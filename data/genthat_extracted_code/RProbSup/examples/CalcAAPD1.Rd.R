library(RProbSup)


### Name: CalcAAPD1
### Title: CalcAAPD1
### Aliases: CalcAAPD1

### ** Examples

x1 <- rnorm(25)
x2 <- x1 - rnorm(25, mean = 1)
x3 <- x2 - rnorm(25, mean = 1)
y <- cbind(c(x1, x2, x3), c(rep(1, 25), rep(2, 25), rep(3, 25)))
AAPD1(y)



