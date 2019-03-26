library(brms)


### Name: mm
### Title: Set up multi-membership grouping terms in 'brms'
### Aliases: mm

### ** Examples

## Not run: 
##D # simulate some data
##D dat <- data.frame(
##D  y = rnorm(100), x1 = rnorm(100), x2 = rnorm(100),
##D  g1 = sample(1:10, 100, TRUE), g2 = sample(1:10, 100, TRUE)
##D )
##D 
##D # multi-membership model with two members per group and equal weights
##D fit1 <- brm(y ~ x1 + (1|mm(g1, g2)), data = dat)
##D summary(fit1)
##D 
##D # weight the first member two times for than the second member
##D dat$w1 <- rep(2, 100)
##D dat$w2 <- rep(1, 100)
##D fit2 <- brm(y ~ x1 + (1|mm(g1, g2, weights = cbind(w1, w2))), data = dat)
##D summary(fit2)
##D 
##D # multi-membership model with level specific covariate values
##D dat$xc <- (dat$x1 + dat$x2) / 2
##D fit3 <- brm(y ~ xc + (1 + mmc(x1, x2) | mm(g1, g2)), data = dat)
##D summary(fit3)
## End(Not run)
  



