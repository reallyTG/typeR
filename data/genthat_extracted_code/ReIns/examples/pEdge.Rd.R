library(ReIns)


### Name: pEdge
### Title: Edgeworth approximation
### Aliases: pEdge

### ** Examples

# Chi-squared sample
X <- rchisq(1000, 2)


x <- seq(0, 10, 0.01)

# Empirical moments
moments = c(mean(X), mean(X^2), mean(X^3), mean(X^4))

# Gram-Charlier approximation
p1 <- pGC(x, moments)

# Edgeworth approximation
p2 <- pEdge(x, moments)

# Normal approximation
p3 <- pClas(x, mean(X), var(X))

# True probabilities
p <- pchisq(x, 2)


# Plot true and estimated probabilities
plot(x, p, type="l", ylab="F(x)", ylim=c(0,1), col="red")
lines(x, p1, lty=2)
lines(x, p2, lty=3)
lines(x, p3, lty=4, col="blue")

legend("bottomright", c("True CDF", "GC approximation", 
                        "Edgeworth approximation", "Normal approximation"), 
       col=c("red", "black", "black", "blue"), lty=1:4, lwd=2)



