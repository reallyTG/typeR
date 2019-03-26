library(npsp)


### Name: disc.sb
### Title: Discretization nodes of a Shapiro-Botha variogram model
### Aliases: disc.sb

### ** Examples

disc.sb( 12, 1, 1.0)

nx <- 1
dk <- 0
x <- disc.sb(nx, dk, 1.0)
h <- seq(0, 1, length = 100)
plot(h, kappasb(x * h, 0), type="l", ylim = c(0, 1))
abline(h = 0.05, lty = 2)



