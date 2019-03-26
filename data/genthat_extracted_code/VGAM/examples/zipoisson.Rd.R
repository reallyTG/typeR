library(VGAM)


### Name: zipoisson
### Title: Zero-Inflated Poisson Distribution Family Function
### Aliases: zipoisson zipoissonff
### Keywords: models regression

### ** Examples

# Example 1: simulated ZIP data
zdata <- data.frame(x2 = runif(nn <- 1000))
zdata <- transform(zdata, pstr01  = logit(-0.5 + 1*x2, inverse = TRUE),
                          pstr02  = logit( 0.5 - 1*x2, inverse = TRUE),
                          Ps01    = logit(-0.5       , inverse = TRUE),
                          Ps02    = logit( 0.5       , inverse = TRUE),
                          lambda1 =  loge(-0.5 + 2*x2, inverse = TRUE),
                          lambda2 =  loge( 0.5 + 2*x2, inverse = TRUE))
zdata <- transform(zdata, y1 = rzipois(nn, lambda = lambda1, pstr0 = Ps01),
                          y2 = rzipois(nn, lambda = lambda2, pstr0 = Ps02))

with(zdata, table(y1))  # Eyeball the data
with(zdata, table(y2))
fit1 <- vglm(y1 ~ x2, zipoisson(zero = 1), data = zdata, crit = "coef")
fit2 <- vglm(y2 ~ x2, zipoisson(zero = 1), data = zdata, crit = "coef")
coef(fit1, matrix = TRUE)  # These should agree with the above values
coef(fit2, matrix = TRUE)  # These should agree with the above values

# Fit all two simultaneously, using a different parameterization:
fit12 <- vglm(cbind(y1, y2) ~ x2, zipoissonff, data = zdata, crit = "coef")
coef(fit12, matrix = TRUE)  # These should agree with the above values

# For the first observation compute the probability that y1 is
# due to a structural zero.
(fitted(fit1, type = "pstr0") / fitted(fit1, type = "pobs0"))[1]


# Example 2: McKendrick (1926). Data from 223 Indian village households
cholera <- data.frame(ncases = 0:4,  # Number of cholera cases,
                      wfreq  = c(168, 32, 16, 6, 1))  # Frequencies
fit <- vglm(ncases ~ 1, zipoisson, wei = wfreq, cholera, trace = TRUE)
coef(fit, matrix = TRUE)
with(cholera, cbind(actual = wfreq,
                    fitted = round(dzipois(ncases, lambda = Coef(fit)[2],
                                           pstr0 = Coef(fit)[1]) *
                                   sum(wfreq), digits = 2)))

# Example 3: data from Angers and Biswas (2003)
abdata <- data.frame(y = 0:7, w = c(182, 41, 12, 2, 2, 0, 0, 1))
abdata <- subset(abdata, w > 0)
fit <- vglm(y ~ 1, zipoisson(lpstr0 = probit, ipstr0 = 0.8),
            data = abdata, weight = w, trace = TRUE)
fitted(fit, type = "pobs0")  # Estimate of P(Y = 0)
coef(fit, matrix = TRUE)
Coef(fit)  # Estimate of pstr0 and lambda
fitted(fit)
with(abdata, weighted.mean(y, w))  # Compare this with fitted(fit)
summary(fit)

# Example 4: zero-deflated model for intercept-only data
zdata <- transform(zdata, lambda3 = loge(0.0, inverse = TRUE))
zdata <- transform(zdata, deflat.limit = -1 / expm1(lambda3))  # Boundary
# The 'pstr0' parameter is negative and in parameter space:
zdata <- transform(zdata, usepstr0 = deflat.limit / 2)  # Not too near the boundary
zdata <- transform(zdata, y3 = rzipois(nn, lambda3, pstr0 = usepstr0))
head(zdata)
with(zdata, table(y3))  # A lot of deflation
fit3 <- vglm(y3 ~ 1, zipoisson(zero = -1, lpstr0 = "identitylink"),
             data = zdata, trace = TRUE, crit = "coef")
coef(fit3, matrix = TRUE)
# Check how accurate it was:
zdata[1, "usepstr0"]  # Answer
coef(fit3)[1]         # Estimate
Coef(fit3)
vcov(fit3)  # Is positive-definite

# Example 5: This RR-ZIP is known as a COZIGAM or COZIVGLM-ZIP
set.seed(123)
rrzip <- rrvglm(Alopacce ~ sm.bs(WaterCon, df = 3), zipoisson(zero = NULL),
                data = hspider, trace = TRUE, Index.corner = 2)
coef(rrzip, matrix = TRUE)
Coef(rrzip)
summary(rrzip)
## Not run: plotvgam(rrzip, lcol = "blue")



