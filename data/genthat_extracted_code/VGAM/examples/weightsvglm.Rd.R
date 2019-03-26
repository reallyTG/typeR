library(VGAM)


### Name: weightsvglm
### Title: Prior and Working Weights of a VGLM fit
### Aliases: weightsvglm
### Keywords: models regression

### ** Examples

pneumo <- transform(pneumo, let = log(exposure.time))
(fit <- vglm(cbind(normal, mild, severe) ~ let,
             cumulative(parallel = TRUE, reverse = TRUE), data = pneumo))
depvar(fit)  # These are sample proportions
weights(fit, type = "prior", matrix = FALSE)  # Number of observations

# Look at the working residuals
nn <- nrow(model.matrix(fit, type = "lm"))
M <- ncol(predict(fit))

wwt <- weights(fit, type = "working", deriv = TRUE)  # In matrix-band format
wz <- m2a(wwt$weights, M = M)  # In array format
wzinv <- array(apply(wz, 3, solve), c(M, M, nn))
wresid <- matrix(NA, nn, M)  # Working residuals
for (ii in 1:nn)
  wresid[ii, ] <- wzinv[, , ii, drop = TRUE] %*% wwt$deriv[ii, ]
max(abs(c(resid(fit, type = "work")) - c(wresid)))  # Should be 0

(zedd <- predict(fit) + wresid)  # Adjusted dependent vector



