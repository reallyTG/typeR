library(rstanarm)


### Name: stan_betareg
### Title: Bayesian beta regression models via Stan
### Aliases: stan_betareg stan_betareg.fit

### ** Examples

### Simulated data
N <- 200
x <- rnorm(N, 2, 1)
z <- rnorm(N, 2, 1)
mu <- binomial(link = "logit")$linkinv(1 + 0.2*x)
phi <- exp(1.5 + 0.4*z)
y <- rbeta(N, mu * phi, (1 - mu) * phi)
hist(y, col = "dark grey", border = FALSE, xlim = c(0,1))
fake_dat <- data.frame(y, x, z)

fit <- stan_betareg(
  y ~ x | z, data = fake_dat, 
  link = "logit", 
  link.phi = "log", 
  algorithm = "optimizing" # just for speed of example
 ) 
print(fit, digits = 2)




