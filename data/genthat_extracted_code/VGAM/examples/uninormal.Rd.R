library(VGAM)


### Name: uninormal
### Title: Univariate Normal Distribution
### Aliases: uninormal
### Keywords: models regression

### ** Examples

udata <- data.frame(x2 = rnorm(nn <- 200))
udata <- transform(udata,
                   y1  = rnorm(nn, m = 1 - 3*x2, sd = exp(1 + 0.2*x2)),
                   y2a = rnorm(nn, m = 1 + 2*x2, sd = exp(1 + 2.0*x2)^0.5),
                   y2b = rnorm(nn, m = 1 + 2*x2, sd = exp(1 + 2.0*x2)^0.5))
fit1 <- vglm(y1 ~ x2, uninormal(zero = NULL), data = udata, trace = TRUE)
coef(fit1, matrix = TRUE)
fit2 <- vglm(cbind(y2a, y2b) ~ x2, data = udata, trace = TRUE,
             uninormal(var = TRUE, parallel = TRUE ~ x2,
                       zero = NULL))
coef(fit2, matrix = TRUE)

# Generate data from N(mu = theta = 10, sigma = theta) and estimate theta.
theta <- 10
udata <- data.frame(y3 = rnorm(100, m = theta, sd = theta))
fit3a <- vglm(y3 ~ 1, uninormal(lsd = "identitylink"), data = udata,
             constraints = list("(Intercept)" = rbind(1, 1)))
fit3b <- vglm(y3 ~ 1, uninormal(lsd = "identitylink", parallel = TRUE ~ 1,
                                zero = NULL), data = udata)
coef(fit3a, matrix = TRUE)
coef(fit3b, matrix = TRUE)  # Same as fit3a



