library(VGAM)


### Name: amlbinomial
### Title: Binomial Logistic Regression by Asymmetric Maximum Likelihood
###   Estimation
### Aliases: amlbinomial
### Keywords: models regression

### ** Examples

# Example: binomial data with lots of trials per observation
set.seed(1234)
sizevec <- rep(100, length = (nn <- 200))
mydat <- data.frame(x = sort(runif(nn)))
mydat <- transform(mydat, prob = logit(-0 + 2.5*x + x^2, inverse = TRUE))
mydat <- transform(mydat, y = rbinom(nn, size = sizevec, prob = prob))
(fit <- vgam(cbind(y, sizevec - y) ~ s(x, df = 3),
             amlbinomial(w = c(0.01, 0.2, 1, 5, 60)),
             mydat, trace = TRUE))
fit@extra

## Not run: 
##D par(mfrow = c(1,2))
##D # Quantile plot
##D with(mydat, plot(x, jitter(y), col = "blue", las = 1, main =
##D      paste(paste(round(fit@extra$percentile, digits = 1), collapse = ", "),
##D            "percentile-expectile curves")))
##D with(mydat, matlines(x, 100 * fitted(fit), lwd = 2, col = "blue", lty = 1))
##D 
##D 
##D # Compare the fitted expectiles with the quantiles
##D with(mydat, plot(x, jitter(y), col = "blue", las = 1, main =
##D      paste(paste(round(fit@extra$percentile, digits = 1), collapse = ", "),
##D            "percentile curves are red")))
##D with(mydat, matlines(x, 100 * fitted(fit), lwd = 2, col = "blue", lty = 1))
##D 
##D for (ii in fit@extra$percentile)
##D     with(mydat, matlines(x, 100 *
##D          qbinom(p = ii/100, size = sizevec, prob = prob) / sizevec,
##D                   col = "red", lwd = 2, lty = 1))
## End(Not run)



