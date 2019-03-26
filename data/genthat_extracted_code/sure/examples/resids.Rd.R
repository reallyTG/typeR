library(sure)


### Name: resids
### Title: Surrogate Residuals
### Aliases: resids resids.default

### ** Examples

#
# Residuals for binary GLMs using the jittering method
#

# Load the MASS package (for the polr function)
library(MASS)

# Simulated probit data with quadratic trend
data(df1)

# Fit logistic regression models (with and without quadratic trend)
fit1 <- polr(y ~ x + I(x ^ 2), data = df1, method = "probit")
fit2 <- polr(y ~ x, data = df1, method = "probit")

# Construct residuals
set.seed(102)  # for reproducibility
res1 <- resids(fit1)
res2 <- resids(fit2)

# Residual-vs-covariate plots
par(mfrow = c(1, 2))
scatter.smooth(df1$x, res1, lpars = list(lwd = 2, col = "red"),
               xlab = expression(x), ylab = "Surrogate residual",
               main = "Correct model")
scatter.smooth(df1$x, res2, lpars = list(lwd = 2, col = "red"),
               xlab = expression(x), ylab = "Surrogate residual",
               main = "Incorrect model")

## Not run: 
##D #
##D # Residuals for cumulative link models using the latent method
##D #
##D 
##D # Load required packages
##D library(ggplot2)  # for autoplot function
##D library(MASS)     # for polr function
##D library(ordinal)  # for clm function
##D 
##D #
##D # Detecting a misspecified mean structure
##D #
##D 
##D # Data simulated from a probit model with a quadratic trend
##D data(df1)
##D ?df1
##D 
##D # Fit a probit model with/without a quadratic trend
##D fit.bad <- polr(y ~ x, data = df1, method = "probit")
##D fit.good <- polr(y ~ x + I(x ^ 2), data = df1, method = "probit")
##D 
##D # Some residual plots
##D p1 <- autoplot(fit.bad, what = "covariate", x = df1$x)
##D p2 <- autoplot(fit.bad, what = "qq")
##D p3 <- autoplot(fit.good, what = "covariate", x = df1$x)
##D p4 <- autoplot(fit.good, what = "qq")
##D 
##D # Display all four plots together (top row corresponds to bad model)
##D grid.arrange(p1, p2, p3, p4, ncol = 2)
##D 
##D #
##D # Detecting heteroscedasticity
##D #
##D 
##D # Data simulated from a probit model with heteroscedasticity.
##D data(df2)
##D ?df2
##D 
##D # Fit a probit model with/without a quadratic trend
##D fit <- polr(y ~ x, data = df2, method = "probit")
##D 
##D # Some residual plots
##D p1 <- autoplot(fit, what = "covariate", x = df1$x)
##D p2 <- autoplot(fit, what = "qq")
##D p3 <- autoplot(fit, what = "fitted")
##D 
##D # Display all three plots together
##D grid.arrange(p1, p2, p3, ncol = 3)
##D 
##D #
##D # Detecting a misspecified link function
##D #
##D 
##D # Data simulated from a log-log model with a quadratic trend.
##D data(df3)
##D ?df3
##D 
##D # Fit models with correctly specified link function
##D clm.loglog <- clm(y ~ x + I(x ^ 2), data = df3, link = "loglog")
##D polr.loglog <- polr(y ~ x + I(x ^ 2), data = df3, method = "loglog")
##D 
##D # Fit models with misspecified link function
##D clm.probit <- clm(y ~ x + I(x ^ 2), data = df3, link = "probit")
##D polr.probit <- polr(y ~ x + I(x ^ 2), data = df3, method = "probit")
##D 
##D # Q-Q plots of the residuals (with bootstrapping)
##D p1 <- autoplot(clm.probit, nsim = 50, what = "qq") +
##D   ggtitle("clm: probit link")
##D p2 <- autoplot(clm.loglog, nsim = 50, what = "qq") +
##D   ggtitle("clm: log-log link (correct link function)")
##D p3 <- autoplot(polr.probit, nsim = 50, what = "qq") +
##D   ggtitle("polr: probit link")
##D p4 <- autoplot(polr.loglog, nsim = 50, what = "qq") +
##D   ggtitle("polr: log-log link (correct link function)")
##D grid.arrange(p1, p2, p3, p4, ncol = 2)
##D 
##D # We can also try various goodness-of-fit tests
##D par(mfrow = c(1, 2))
##D plot(gof(clm.probit, nsim = 50))
##D plot(gof(clm.loglog, nsim = 50))
## End(Not run)



