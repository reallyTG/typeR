library(VGAM)


### Name: amlpoisson
### Title: Poisson Regression by Asymmetric Maximum Likelihood Estimation
### Aliases: amlpoisson
### Keywords: models regression

### ** Examples

set.seed(1234)
mydat <- data.frame(x = sort(runif(nn <- 200)))
mydat <- transform(mydat, y = rpois(nn, exp(0 - sin(8*x))))
(fit <- vgam(y ~ s(x), fam = amlpoisson(w.aml = c(0.02, 0.2, 1, 5, 50)),
             mydat, trace = TRUE))
fit@extra

## Not run: 
##D # Quantile plot
##D with(mydat, plot(x, jitter(y), col = "blue", las = 1, main =
##D      paste(paste(round(fit@extra$percentile, digits = 1), collapse = ", "),
##D            "percentile-expectile curves")))
##D with(mydat, matlines(x, fitted(fit), lwd = 2)) 
## End(Not run)



