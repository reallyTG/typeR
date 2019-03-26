library(VGAM)


### Name: qvar
### Title: Quasi-variances Extraction Function
### Aliases: qvar
### Keywords: models regression

### ** Examples

data("ships", package = "MASS")
Shipmodel <- vglm(incidents ~ type + year + period,
                  poissonff, offset = log(service),
                  data = ships, subset = (service > 0))

# Easiest form of input
fit1 <- rcim(Qvar(Shipmodel, "type"), uninormal("explink"), maxit = 99)
qvar(fit1)             # Quasi-variances
qvar(fit1, se = TRUE)  # Quasi-standard errors

# Manually compute them:
(quasiVar <- exp(diag(fitted(fit1))) / 2)                 # Version 1
(quasiVar <- diag(predict(fit1)[, c(TRUE, FALSE)]) / 2)   # Version 2
(quasiSE  <- sqrt(quasiVar))

## Not run:  qvplot(fit1, col = "green", lwd = 3, scol = "blue", slwd = 2, las = 1) 



