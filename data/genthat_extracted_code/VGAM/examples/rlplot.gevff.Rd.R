library(VGAM)


### Name: rlplot.gevff
### Title: Return Level Plot for GEV Fits
### Aliases: rlplot.gevff rlplot.gev
### Keywords: graphs models regression

### ** Examples

gdata <- data.frame(y = rgev(n <- 100, scale = 2, shape = -0.1))
fit <- vglm(y ~ 1, gevff, data = gdata, trace = TRUE)

# Identity link for all parameters:
fit2 <- vglm(y ~ 1, gevff(lshape = identitylink, lscale = identitylink,
                          iscale = 10), data = gdata, trace = TRUE)
coef(fit2, matrix = TRUE)
## Not run: 
##D par(mfrow = c(1, 2))
##D rlplot(fit) -> i1
##D rlplot(fit2, pcol = "darkorange", lcol = "blue", log.arg = FALSE,
##D        scol = "darkgreen", slty = "dashed", las = 1) -> i2
##D range(i2@post$rlplot$upper - i1@post$rlplot$upper)  # Should be near 0
##D range(i2@post$rlplot$lower - i1@post$rlplot$lower)  # Should be near 0
## End(Not run)



