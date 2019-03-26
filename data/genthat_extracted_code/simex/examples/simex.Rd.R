library(simex)


### Name: simex
### Title: Measurement error in models using SIMEX
### Aliases: simex print.simex summary.simex print.summary.simex plot.simex
###   predict.simex refit refit.simex plot.simex predict.simex print.simex
###   print.summary.simex refit.simex summary.simex
### Keywords: models

### ** Examples

## Seed
set.seed(49494)

## simulating the measurement error standard deviations
sd_me <- 0.3
sd_me2 <- 0.4
temp <- runif(100, min = 0, max = 0.6)
sd_me_het1 <- sort(temp)
temp2 <- rnorm(100, sd = 0.1)
sd_me_het2 <- abs(sd_me_het1 + temp2)

## simulating the independent variables x (real and with measurement error):

x_real <- rnorm(100)
x_real2 <- rpois(100, lambda = 2)
x_real3 <- -4*x_real + runif(100, min = -10, max = 10)  # correlated to x_real

x_measured <- x_real + sd_me * rnorm(100)
x_measured2 <- x_real2 + sd_me2 * rnorm(100)
x_het1 <- x_real + sd_me_het1 * rnorm(100)
x_het2 <- x_real3 + sd_me_het2 * rnorm(100)

## calculating dependent variable y:
y <- x_real + rnorm(100, sd = 0.05)
y2 <- x_real + 2*x_real2 + rnorm(100, sd = 0.08)
y3 <- x_real + 2*x_real3 + rnorm(100, sd = 0.08)

### one variable with homoscedastic measurement error
(model_real <- lm(y ~ x_real))

(model_naiv <- lm(y ~ x_measured, x = TRUE))

(model_simex <- simex(model_naiv, SIMEXvariable = "x_measured", measurement.error = sd_me))
plot(model_simex)

### two variables with homoscedastic measurement errors
(model_real2 <- lm(y2 ~ x_real + x_real2))
(model_naiv2 <- lm(y2 ~ x_measured + x_measured2, x = TRUE))
(model_simex2 <- simex(model_naiv2, SIMEXvariable = c("x_measured", "x_measured2"),
         measurement.error = cbind(sd_me, sd_me2)))

plot(model_simex2)

## Not run: 
##D ### one variable with increasing heteroscedastic measurement error
##D model_real
##D 
##D (mod_naiv1 <- lm(y ~ x_het1, x = TRUE))
##D (mod_simex1 <- simex(mod_naiv1, SIMEXvariable = "x_het1",
##D                 measurement.error = sd_me_het1, asymptotic = FALSE))
##D 
##D plot(mod_simex1)
##D 
##D ### two correlated variables with heteroscedastic measurement errors
##D (model_real3 <- lm(y3 ~ x_real + x_real3))
##D (mod_naiv2 <- lm(y3 ~ x_het1 + x_het2, x = TRUE))
##D (mod_simex2 <- simex(mod_naiv2, SIMEXvariable = c("x_het1", "x_het2"),
##D               measurement.error = cbind(sd_me_het1, sd_me_het2), asymptotic = FALSE))
##D 
##D plot(mod_simex2)
##D 
##D ### two variables, one with homoscedastic, one with heteroscedastic measurement error
##D model_real2
##D (mod_naiv3 <- lm(y2 ~ x_measured + x_het2, x = TRUE))
##D (mod_simex3 <- simex(mod_naiv3, SIMEXvariable = c("x_measured", "x_het2"),
##D                     measurement.error = cbind(sd_me, sd_me_het2), asymptotic = FALSE))
##D 
##D ### glm: two variables, one with homoscedastic, one with heteroscedastic measurement error
##D t <- x_real + 2*x_real2 + rnorm(100, sd = 0.01)
##D g <- 1 / (1 + exp(t))
##D u <- runif(100)
##D ybin <- as.numeric(u < g)
##D 
##D (logit_real <- glm(ybin ~ x_real + x_real2, family = binomial))
##D (logit_naiv <- glm(ybin ~ x_measured + x_het2, x = TRUE, family = binomial))
##D (logit_simex <- simex(logit_naiv, SIMEXvariable = c("x_measured", "x_het2"),
##D                     measurement.error = cbind(sd_me, sd_me_het2), asymptotic = FALSE))
##D 
##D summary(logit_simex)
##D print(logit_simex)
##D plot(logit_simex)
##D 
##D ### polr: two variables, one with homoscedastic, one with heteroscedastic measurement error
##D 
##D if(require("MASS")) {# Requires MASS
##D yerr <- jitter(y, amount=1)
##D yfactor <- cut(yerr, 3, ordered_result=TRUE)
##D 
##D (polr_real <- polr(yfactor ~ x_real + x_real2))
##D (polr_naiv <- polr(yfactor ~ x_measured + x_het2, Hess = TRUE))
##D (polr_simex <- simex(polr_naiv, SIMEXvariable = c("x_measured", "x_het2"),
##D                     measurement.error = cbind(sd_me, sd_me_het2), asymptotic = FALSE))
##D 
##D summary(polr_simex)
##D print(polr_simex)
##D plot(polr_simex)
##D }
## End(Not run)




