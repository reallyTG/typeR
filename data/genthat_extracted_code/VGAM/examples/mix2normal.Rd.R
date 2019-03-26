library(VGAM)


### Name: mix2normal
### Title: Mixture of Two Univariate Normal Distributions
### Aliases: mix2normal
### Keywords: models regression

### ** Examples

## Not run: 
##D  mu1 <-  99; mu2 <- 150; nn <- 1000
##D sd1 <- sd2 <- exp(3)
##D (phi <- logit(-1, inverse = TRUE))
##D mdata <- data.frame(y = ifelse(runif(nn) < phi, rnorm(nn, mu1, sd1),
##D                                                 rnorm(nn, mu2, sd2)))
##D fit <- vglm(y ~ 1, mix2normal(eq.sd = TRUE), data = mdata)
##D 
##D # Compare the results
##D cfit <- coef(fit)
##D round(rbind('Estimated' = c(logit(cfit[1], inverse = TRUE),
##D             cfit[2], exp(cfit[3]), cfit[4]),
##D             'Truth' = c(phi, mu1, sd1, mu2)), digits = 2)
##D 
##D # Plot the results
##D xx <- with(mdata, seq(min(y), max(y), len = 200))
##D plot(xx, (1-phi) * dnorm(xx, mu2, sd2), type = "l", xlab = "y",
##D      main = "Orange = estimate, blue = truth",
##D      col = "blue", ylab = "Density")
##D phi.est <- logit(coef(fit)[1], inverse = TRUE)
##D sd.est <- exp(coef(fit)[3])
##D lines(xx, phi*dnorm(xx, mu1, sd1), col = "blue")
##D lines(xx, phi.est * dnorm(xx, Coef(fit)[2], sd.est), col = "orange")
##D lines(xx, (1-phi.est) * dnorm(xx, Coef(fit)[4], sd.est), col = "orange")
##D abline(v = Coef(fit)[c(2,4)], lty = 2, col = "orange")
##D abline(v = c(mu1, mu2), lty = 2, col = "blue")
## End(Not run)



