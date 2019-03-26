library(actuar)


### Name: Logarithmic
### Title: The Logarithmic Distribution
### Aliases: Logarithmic dlogarithmic plogarithmic qlogarithmic
###   rlogarithmic log-series
### Keywords: distribution

### ** Examples

## Table 1 of Kemp (1981) [also found in Johnson et al. (2005), chapter 7]
p <- c(0.1, 0.3, 0.5, 0.7, 0.8, 0.85, 0.9, 0.95, 0.99, 0.995, 0.999, 0.9999)
round(rbind(dlogarithmic(1, p),
            dlogarithmic(2, p),
            plogarithmic(9, p, lower.tail = FALSE),
            -p/((1 - p) * log(1 - p))), 2)

qlogarithmic(plogarithmic(1:10, 0.9), 0.9)

x <- rlogarithmic(1000, 0.8)
y <- sort(unique(x))
plot(y, table(x)/length(x), type = "h", lwd = 2,
     pch = 19, col = "black", xlab = "x", ylab = "p(x)",
     main = "Empirical vs theoretical probabilities")
points(y, dlogarithmic(y, prob = 0.8),
       pch = 19, col = "red")
legend("topright", c("empirical", "theoretical"),
       lty = c(1, NA), pch = c(NA, 19), col = c("black", "red"))



