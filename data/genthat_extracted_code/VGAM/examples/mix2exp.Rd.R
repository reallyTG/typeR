library(VGAM)


### Name: mix2exp
### Title: Mixture of Two Exponential Distributions
### Aliases: mix2exp
### Keywords: models regression

### ** Examples

## Not run: 
##D  lambda1 <- exp(1); lambda2 <- exp(3)
##D (phi <- logit(-1, inverse = TRUE))
##D mdata <- data.frame(y1 = rexp(nn <- 1000, lambda1))
##D mdata <- transform(mdata, y2 = rexp(nn, lambda2))
##D mdata <- transform(mdata, Y  = ifelse(runif(nn) < phi, y1, y2))
##D fit <- vglm(Y ~ 1, mix2exp, data = mdata, trace = TRUE)
##D coef(fit, matrix = TRUE)
##D 
##D # Compare the results with the truth
##D round(rbind('Estimated' = Coef(fit),
##D             'Truth' = c(phi, lambda1, lambda2)), digits = 2)
##D 
##D with(mdata, hist(Y, prob = TRUE, main = "Orange = estimate, blue = truth"))
##D abline(v = 1 / Coef(fit)[c(2, 3)],  lty = 2, col = "orange", lwd = 2)
##D abline(v = 1 / c(lambda1, lambda2), lty = 2, col = "blue", lwd = 2)
## End(Not run)



