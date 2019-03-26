library(VGAM)


### Name: gpd
### Title: Generalized Pareto Distribution Family Function
### Aliases: gpd
### Keywords: models regression

### ** Examples

# Simulated data from an exponential distribution (xi = 0)
Threshold <- 0.5
gdata <- data.frame(y1 = Threshold + rexp(n = 3000, rate = 2))
fit <- vglm(y1 ~ 1, gpd(threshold = Threshold), data = gdata, trace = TRUE)
head(fitted(fit))
summary(depvar(fit))  # The original uncentred data
coef(fit, matrix = TRUE)  # xi should be close to 0
Coef(fit)
summary(fit)

head(fit@extra$threshold)  # Note the threshold is stored here

# Check the 90 percentile
ii <- depvar(fit) < fitted(fit)[1, "90%"]
100 * table(ii) / sum(table(ii))  # Should be 90%

# Check the 95 percentile
ii <- depvar(fit) < fitted(fit)[1, "95%"]
100 * table(ii) / sum(table(ii))  # Should be 95%

## Not run: 
##D  plot(depvar(fit), col = "blue", las = 1,
##D                main = "Fitted 90% and 95% quantiles")
##D matlines(1:length(depvar(fit)), fitted(fit), lty = 2:3, lwd = 2) 
## End(Not run)


# Another example
gdata <- data.frame(x2 = runif(nn <- 2000))
Threshold <- 0; xi <- exp(-0.8) - 0.5
gdata <- transform(gdata, y2 = rgpd(nn, scale = exp(1 + 0.1*x2), shape = xi))
fit <- vglm(y2 ~ x2, gpd(Threshold), data = gdata, trace = TRUE)
coef(fit, matrix = TRUE)


## Not run: 
##D  # Nonparametric fits
##D # Not so recommended:
##D fit1 <- vgam(y2 ~ s(x2), gpd(Threshold), data = gdata, trace = TRUE)
##D par(mfrow = c(2, 1))
##D plot(fit1, se = TRUE, scol = "blue")
##D # More recommended:
##D fit2 <- vglm(y2 ~ sm.bs(x2), gpd(Threshold), data = gdata, trace = TRUE)
##D plot(as(fit2, "vgam"), se = TRUE, scol = "blue") 
## End(Not run)



