library(esaddle)


### Name: findMode
### Title: Finding the mode of the empirical saddlepoint density
### Aliases: findMode

### ** Examples

# library(esaddle)
set.seed(4141)
x <- rgamma(1000, 2, 1)

# Fixing tuning parameter of EES
decay <-  0.05

# Evaluating EES at several point
xSeq <- seq(-2, 8, length.out = 200)
tmp <- dsaddle(y = xSeq, X = x, decay = decay, log = TRUE)  # Un-normalized EES

# Plotting true density, EES and normal approximation
plot(xSeq, exp(tmp$llk), type = 'l', ylab = "Density", xlab = "x")
lines(xSeq, dgamma(xSeq, 2, 1), col = 3)
suppressWarnings( rug(x) )
legend("topright", c("EES", "Truth"), col = c(1, 3), lty = 1)

# Find mode and plot it
res <- findMode(x, init = mean(x), decay = decay)$mode
abline(v = res, lty = 2, lwd = 1.5)



