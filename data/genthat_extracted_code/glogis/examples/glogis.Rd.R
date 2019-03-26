library(glogis)


### Name: glogis
### Title: The Generalized Logistic Distribution (Type I: Skew-Logitic)
### Aliases: dglogis pglogis qglogis rglogis sglogis
### Keywords: distribution

### ** Examples

## PDF and CDF
par(mfrow = c(1, 2))
x <- -100:100/10
plot(x, dglogis(x, shape = 2), type = "l", col = 4, main = "PDF", ylab = "f(x)")
lines(x, dglogis(x, shape = 1))
lines(x, dglogis(x, shape = 0.5), col = 2)
legend("topleft", c("generalized (0, 1, 2)", "standard (0, 1, 1)",
  "generalized (0, 1, 0.5)"), lty = 1, col = c(4, 1, 2), bty = "n")
plot(x, pglogis(x, shape = 2), type = "l", col = 4, main = "CDF", ylab = "F(x)")
lines(x, pglogis(x, shape = 1))
lines(x, pglogis(x, shape = 0.5), col = 2)

## artifical empirical example
set.seed(2)
x <- rglogis(1000, -1, scale = 0.5, shape = 3)
gf <- glogisfit(x)
plot(gf)
summary(gf)



