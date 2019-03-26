library(VGAM)


### Name: kendall.tau
### Title: Kendall's Tau Statistic
### Aliases: kendall.tau
### Keywords: math

### ** Examples

N <- 5000; x <- 1:N; y <- runif(N)
true.rho <- -0.8
ymat <- rbinorm(N, cov12 =  true.rho)  # Bivariate normal, aka N_2
x <- ymat[, 1]
y <- ymat[, 2]

## Not run: plot(x, y, col = "blue")

kendall.tau(x, y)  # A random sample is taken here
kendall.tau(x, y)  # A random sample is taken here

kendall.tau(x, y, exact = TRUE)  # Costly if length(x) is large
kendall.tau(x, y, max.n = N)     # Same as exact = TRUE

(rhohat <- sin(kendall.tau(x, y) * pi / 2))  # This formula holds for N_2 actually
true.rho  # rhohat should be near this value



