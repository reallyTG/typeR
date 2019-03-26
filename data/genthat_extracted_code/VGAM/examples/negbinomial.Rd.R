library(VGAM)


### Name: negbinomial
### Title: Negative Binomial Distribution Family Function
### Aliases: negbinomial polya polyaR
### Keywords: models regression

### ** Examples

# Example 1: apple tree data (Bliss and Fisher, 1953)
appletree <- data.frame(y = 0:7, w = c(70, 38, 17, 10, 9, 3, 2, 1))
fit <- vglm(y ~ 1, negbinomial(deviance = TRUE), data = appletree,
            weights = w, crit = "coef")  # Obtain the deviance
fit <- vglm(y ~ 1, negbinomial(deviance = TRUE), data = appletree,
            weights = w, half.step = FALSE)  # Alternative method
summary(fit)
coef(fit, matrix = TRUE)
Coef(fit)  # For intercept-only models
deviance(fit)  # NB2 only; needs 'crit = "coef"' & 'deviance = TRUE' above

# Example 2: simulated data with multiple responses
## Not run: 
##D ndata <- data.frame(x2 = runif(nn <- 200))
##D ndata <- transform(ndata, y1 = rnbinom(nn, mu = exp(3+x2), size = exp(1)),
##D                           y2 = rnbinom(nn, mu = exp(2-x2), size = exp(0)))
##D fit1 <- vglm(cbind(y1, y2) ~ x2, negbinomial, data = ndata, trace = TRUE)
##D coef(fit1, matrix = TRUE)
## End(Not run)

# Example 3: large counts implies SFS is used
## Not run: 
##D ndata <- transform(ndata, y3 = rnbinom(nn, mu = exp(10+x2), size = exp(1)))
##D with(ndata, range(y3))  # Large counts
##D fit2 <- vglm(y3 ~ x2, negbinomial, data = ndata, trace = TRUE)
##D coef(fit2, matrix = TRUE)
##D head(fit2@weights)  # Non-empty; SFS was used
## End(Not run)

# Example 4: a NB-1 to estimate a negative binomial with Var(Y) = phi0 * mu
nn <- 200  # Number of observations
phi0 <- 10  # Specify this; should be greater than unity
delta0 <- 1 / (phi0 - 1)
mydata <- data.frame(x2 = runif(nn), x3 = runif(nn))
mydata <- transform(mydata, mu = exp(2 + 3 * x2 + 0 * x3))
mydata <- transform(mydata, y3 = rnbinom(nn, mu = mu, size = delta0 * mu))
## Not run: 
##D plot(y3 ~ x2, data = mydata, pch = "+", col = "blue",
##D      main = paste("Var(Y) = ", phi0, " * mu", sep = ""), las = 1) 
## End(Not run)
nb1 <- vglm(y3 ~ x2 + x3, negbinomial(parallel = TRUE, zero = NULL),
            data = mydata, trace = TRUE)
# Extracting out some quantities:
cnb1 <- coef(nb1, matrix = TRUE)
mydiff <- (cnb1["(Intercept)", "loge(size)"] -
           cnb1["(Intercept)", "loge(mu)"])
delta0.hat <- exp(mydiff)
(phi.hat <- 1 + 1 / delta0.hat)  # MLE of phi
summary(nb1)
# Obtain a 95 percent confidence interval for phi0:
myvec <- rbind(-1, 1, 0, 0)
(se.mydiff <- sqrt(t(myvec) %*%  vcov(nb1) %*%  myvec))
ci.mydiff <- mydiff + c(-1.96, 1.96) * se.mydiff
ci.delta0 <- ci.exp.mydiff <- exp(ci.mydiff)
(ci.phi0 <- 1 + 1 / rev(ci.delta0))  # The 95 percent conf. interval for phi0

Confint.nb1(nb1)  # Quick way to get it

summary(glm(y3 ~ x2 + x3, quasipoisson, mydata))$disper  # cf. moment estimator



