library(VGAM)


### Name: expexpff
### Title: Exponentiated Exponential Distribution
### Aliases: expexpff
### Keywords: models regression

### ** Examples

# A special case: exponential data
edata <- data.frame(y = rexp(n <- 1000))
fit <- vglm(y ~ 1, fam = expexpff, data = edata, trace = TRUE, maxit = 99)
coef(fit, matrix = TRUE)
Coef(fit)


# Ball bearings data (number of million revolutions before failure)
edata <- data.frame(bbearings = c(17.88, 28.92, 33.00, 41.52, 42.12, 45.60,
48.80, 51.84, 51.96, 54.12, 55.56, 67.80, 68.64, 68.64,
68.88, 84.12, 93.12, 98.64, 105.12, 105.84, 127.92,
128.04, 173.40))
fit <- vglm(bbearings ~ 1, fam = expexpff(irate = 0.05, ish = 5),
            trace = TRUE, maxit = 300, data = edata)
coef(fit, matrix = TRUE)
Coef(fit)    # Authors get c(rate=0.0314, shape=5.2589)
logLik(fit)  # Authors get -112.9763


# Failure times of the airconditioning system of an airplane
eedata <- data.frame(acplane = c(23, 261, 87, 7, 120, 14, 62, 47,
225, 71, 246, 21, 42, 20, 5, 12, 120, 11, 3, 14,
71, 11, 14, 11, 16, 90, 1, 16, 52, 95))
fit <- vglm(acplane ~ 1, fam = expexpff(ishape = 0.8, irate = 0.15),
            trace = TRUE, maxit = 99, data = eedata)
coef(fit, matrix = TRUE)
Coef(fit)    # Authors get c(rate=0.0145, shape=0.8130)
logLik(fit)  # Authors get log-lik -152.264



