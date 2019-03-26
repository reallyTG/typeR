library(VGAM)


### Name: amlexponential
### Title: Exponential Regression by Asymmetric Maximum Likelihood
###   Estimation
### Aliases: amlexponential
### Keywords: models regression

### ** Examples

nn <- 2000
mydat <- data.frame(x = seq(0, 1, length = nn))
mydat <- transform(mydat, mu = loge(-0 + 1.5*x + 0.2*x^2, inverse = TRUE))
mydat <- transform(mydat, mu = loge(0 - sin(8*x), inverse = TRUE))
mydat <- transform(mydat,  y = rexp(nn, rate = 1/mu))
(fit  <- vgam(y ~ s(x,df = 5), amlexponential(w = c(0.001, 0.1, 0.5, 5, 60)),
              mydat, trace = TRUE))
fit@extra

## Not run: 
##D  # These plots are against the sqrt scale (to increase clarity)
##D par(mfrow = c(1,2))
##D # Quantile plot
##D with(mydat, plot(x, sqrt(y), col = "blue", las = 1, main =
##D      paste(paste(round(fit@extra$percentile, digits = 1), collapse = ", "),
##D            "percentile-expectile curves")))
##D with(mydat, matlines(x, sqrt(fitted(fit)), lwd = 2, col = "blue", lty = 1))
##D 
##D # Compare the fitted expectiles with the quantiles
##D with(mydat, plot(x, sqrt(y), col = "blue", las = 1, main =
##D      paste(paste(round(fit@extra$percentile, digits = 1), collapse = ", "),
##D            "percentile curves are orange")))
##D with(mydat, matlines(x, sqrt(fitted(fit)), lwd = 2, col = "blue", lty = 1))
##D 
##D for (ii in fit@extra$percentile)
##D   with(mydat, matlines(x, sqrt(qexp(p = ii/100, rate = 1/mu)), col = "orange")) 
## End(Not run)



