library(DescTools)


### Name: HoeffD
### Title: Matrix of Hoeffding's D Statistics
### Aliases: HoeffD print.HoeffD
### Keywords: nonparametric htest

### ** Examples

x <- c(-2, -1, 0, 1, 2)
y <- c(4,   1, 0, 1, 4)
z <- c(1,   2, 3, 4, NA)
q <- c(1,   2, 3, 4, 5)

HoeffD(cbind(x, y, z, q))


# Hoeffding's test can detect even one-to-many dependency
set.seed(1)
x <- seq(-10, 10, length=200)
y <- x * sign(runif(200, -1, 1))
plot(x, y)

HoeffD(x, y)



