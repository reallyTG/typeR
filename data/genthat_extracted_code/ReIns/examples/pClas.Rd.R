library(ReIns)


### Name: pClas
### Title: Classical estimators for the CDF
### Aliases: pClas

### ** Examples

# Chi-squared sample
X <- rchisq(1000, 2)

x <- seq(0, 10, 0.01)

# Classical approximations
p1 <- pClas(x, mean(X), var(X))
p2 <- pClas(x, mean(X), var(X), mean((X-mean(X))^3)/sd(X)^3, method="normal-power")
p3 <- pClas(x, mean(X), var(X), mean((X-mean(X))^3)/sd(X)^3, method="shifted Gamma")
p4 <- pClas(x, mean(X), var(X), mean((X-mean(X))^3)/sd(X)^3, method="shifted Gamma normal")

# True probabilities
p <- pchisq(x, 2)


# Plot true and estimated probabilities
plot(x, p, type="l", ylab="F(x)", ylim=c(0,1), col="red")
lines(x, p1, lty=2)
lines(x, p2, lty=3, col="green")
lines(x, p3, lty=4)
lines(x, p4, lty=5, col="blue")

legend("bottomright", c("True CDF", "normal approximation", "normal-power approximation",
                        "shifted Gamma approximation", "shifted Gamma normal approximation"), 
      lty=1:5, col=c("red", "black", "green", "black", "blue"), lwd=2)



