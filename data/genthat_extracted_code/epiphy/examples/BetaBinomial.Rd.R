library(epiphy)


### Name: BetaBinomial
### Title: The beta-binomial distribution.
### Aliases: BetaBinomial dbetabinom pbetabinom qbetabinom rbetabinom

### ** Examples

# Compute P(25 < X < 50) for X following the Beta-Binomial distribution
# with parameters size = 100, prob = 0.5 and theta = 0.35:
sum(dbetabinom(25:50, size = 100, prob = 0.5, theta = 0.35))

# When theta tends to 0, dbetabinom outputs tends to dbinom outputs:
sum(dbetabinom(25:50, size = 100, prob = 0.5, theta = 1e-7))
sum(dbetabinom(25:50, size = 100, shape1 = 1e7, shape2 = 1e7))
sum(dbinom(25:50, size = 100, prob = 0.5))

# Example of binomial and beta-binomial frequency distributions:
n   <- 15
q   <- 0:n
p1  <- dbinom(q, size = n, prob = 0.33)
p2  <- dbetabinom(q, size = n, prob = 0.33, theta = 0.22)
res <- rbind(p1, p2)
dimnames(res) <- list(c("Binomial", "Beta-binomial"), q)
barplot(res, beside = TRUE, legend.text = TRUE, ylab = "Frequency")

# Effect of the aggregation parameter theta on probability density:
thetas <- seq(0.001, 2.5, by = 0.001)
density1 <- rep(sum(dbinom(25:50, size = 100, prob = 0.5)), length(thetas))
density2 <- sapply(thetas, function(theta) {
    sum(dbetabinom(25:50, size = 100, prob = 0.5, theta = theta))
})
plot(thetas, density2, type = "l",
     xlab = expression("Aggregation parameter ("*theta*")"),
     ylab = "Probability density between 25 and 50 (size = 100)")
lines(thetas, density1, lty = 2)




