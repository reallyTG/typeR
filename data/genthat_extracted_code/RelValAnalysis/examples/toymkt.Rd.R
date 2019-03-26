library(RelValAnalysis)


### Name: toymkt
### Title: Toy Market Objects
### Aliases: toymkt toymkt.default

### ** Examples

# We use the EuStockMarkets dataset in the datasets package
data(EuStockMarkets)

# Example 1: Minimal specifications
# The market will be equal-weighted initially.
market <- toymkt(price = EuStockMarkets)
print(market)
plot(market)  # several plots


# Example 2: Generate a market from simulated log-normal returns.
n.periods <- 60
n.stocks <- 5
mu <- 0
sigma <- 0.1
R <- matrix(0, nrow = n.periods, ncol = n.stocks)
for (j in 1:n.stocks) {
  R[, j] <- exp(rnorm(n.periods, mean = mu, sd = sigma)) - 1
}
initial.weight <- c(0.1, 0.2, 0.3, 0.2, 0.2)  # specify initial weights
market <- toymkt(R = R, initial.weight = initial.weight,
                 buy.and.hold = TRUE)
plot(market)



