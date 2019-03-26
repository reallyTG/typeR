library(VGAM)


### Name: gumbel
### Title: Gumbel Distribution Family Function
### Aliases: gumbel gumbelff
### Keywords: models regression

### ** Examples

# Example 1: Simulated data
gdata <- data.frame(y1 = rgumbel(n = 1000, loc = 100, scale = exp(1)))
fit1 <- vglm(y1 ~ 1, gumbelff(perc = NULL), data = gdata, trace = TRUE)
coef(fit1, matrix = TRUE)
Coef(fit1)
head(fitted(fit1))
with(gdata, mean(y1))

# Example 2: Venice data
(fit2 <- vglm(cbind(r1, r2, r3, r4, r5) ~ year, data = venice,
              gumbel(R = 365, mpv = TRUE), trace = TRUE))
head(fitted(fit2))
coef(fit2, matrix = TRUE)
sqrt(diag(vcov(summary(fit2))))   # Standard errors

# Example 3: Try a nonparametric fit ---------------------
# Use the entire data set, including missing values
# Same as as.matrix(venice[, paste0("r", 1:10)]):
Y <- Select(venice, "r", sort = FALSE)
fit3 <- vgam(Y ~ s(year, df = 3), gumbel(R = 365, mpv = TRUE),
             data = venice, trace = TRUE, na.action = na.pass)
depvar(fit3)[4:5, ]  # NAs used to pad the matrix

## Not run: 
##D   # Plot the component functions
##D par(mfrow = c(2, 3), mar = c(6, 4, 1, 2) + 0.3, xpd = TRUE)
##D plot(fit3, se = TRUE, lcol = "blue", scol = "limegreen", lty = 1,
##D      lwd = 2, slwd = 2, slty = "dashed")
##D 
##D # Quantile plot --- plots all the fitted values
##D qtplot(fit3, mpv = TRUE, lcol = c(1, 2, 5), tcol = c(1, 2, 5), lwd = 2,
##D        pcol = "blue", tadj = 0.1, ylab = "Sea level (cm)")
##D 
##D # Plot the 99 percentile only
##D year <- venice[["year"]]
##D matplot(year, Y, ylab = "Sea level (cm)", type = "n")
##D matpoints(year, Y, pch = "*", col = "blue")
##D lines(year, fitted(fit3)[, "99%"], lwd = 2, col = "orange")
##D 
##D # Check the 99 percentiles with a smoothing spline.
##D # Nb. (1-0.99) * 365 = 3.65 is approx. 4, meaning the 4th order
##D # statistic is approximately the 99 percentile.
##D plot(year, Y[, 4], ylab = "Sea level (cm)", type = "n",
##D      main = "Orange is 99 percentile, Green is a smoothing spline")
##D points(year, Y[, 4], pch = "4", col = "blue")
##D lines(year, fitted(fit3)[, "99%"], lty = 1, col = "orange")
##D lines(smooth.spline(year, Y[, 4], df = 4), col = "limegreen", lty = 2)
## End(Not run)



