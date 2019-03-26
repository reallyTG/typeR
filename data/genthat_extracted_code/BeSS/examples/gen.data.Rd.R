library(BeSS)


### Name: gen.data
### Title: Generate simulated data
### Aliases: gen.data

### ** Examples


# Generate simulated data
n <- 500
p <- 20
K <-10
sigma <- 1
rho <- 0.2
data <- gen.data(n, p, family = "gaussian", K, rho, sigma)

# Best subset selection
fit <- bess(data$x, data$y, family = "gaussian")





