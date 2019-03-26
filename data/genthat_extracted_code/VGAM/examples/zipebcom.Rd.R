library(VGAM)


### Name: zipebcom
### Title: Exchangeable Bivariate cloglog Odds-ratio Model From a
###   Zero-inflated Poisson Distribution
### Aliases: zipebcom
### Keywords: models regression

### ** Examples

zdata <- data.frame(x2 = seq(0, 1, len = (nsites <- 2000)))
zdata <- transform(zdata, eta1 =  -3 + 5 * x2,
                         phi1 = logit(-1, inverse = TRUE),
                         oratio = exp(2))
zdata <- transform(zdata, mu12 = cloglog(eta1, inverse = TRUE) * (1-phi1))
tmat <-  with(zdata, rbinom2.or(nsites, mu1 = mu12, oratio = oratio, exch = TRUE))
zdata <- transform(zdata, ybin1 = tmat[, 1], ybin2 = tmat[, 2])

with(zdata, table(ybin1, ybin2)) / nsites  # For interest only
## Not run: 
##D # Various plots of the data, for interest only
##D par(mfrow = c(2, 2))
##D plot(jitter(ybin1) ~ x2, data = zdata, col = "blue")
##D 
##D plot(jitter(ybin2) ~ jitter(ybin1), data = zdata, col = "blue")
##D 
##D plot(mu12 ~ x2, data = zdata, col = "blue", type = "l", ylim = 0:1,
##D      ylab = "Probability", main = "Marginal probability and phi")
##D with(zdata, abline(h = phi1[1], col = "red", lty = "dashed"))
##D 
##D tmat2 <- with(zdata, dbinom2.or(mu1 = mu12, oratio = oratio, exch = TRUE))
##D with(zdata, matplot(x2, tmat2, col = 1:4, type = "l", ylim = 0:1,
##D      ylab = "Probability", main = "Joint probabilities")) 
## End(Not run)

# Now fit the model to the data.
fit <- vglm(cbind(ybin1, ybin2) ~ x2, zipebcom, data = zdata, trace = TRUE)
coef(fit, matrix = TRUE)
summary(fit)
vcov(fit)



