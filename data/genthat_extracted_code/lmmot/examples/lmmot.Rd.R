library(lmmot)


### Name: lmmot
### Title: Multiple Ordinal Tobit Model
### Aliases: lmmot

### ** Examples

# Random data for x
N <- 100
x <- rnorm(N, 25, 10)

# Simulate data for latent variable ystar with simple linear model
beta_0 <- 60
beta_1 <- 1
sigma <- 8
ystar <- beta_0 + beta_1*x + rnorm(N, 0, sigma)

# Simulate censoring for observed variable y
y <- ystar
y[y >= 100] <- 100
y[(y >= 90) & (y < 100)] <- 90
y[(y >= 80) & (y < 90)] <- 80

# MOT regression with observed variable y
mot.fit <- lmmot(y ~ x, threshold = c(80, 90, 100))

# Show details
summary(mot.fit)

# Compare real data with model fit 
plot(x, ystar)
abline(coefficients(mot.fit)[1:2])



