library(simex)


### Name: simex-package
### Title: Error or misclassification correction in models using (MC)SIMEX
### Aliases: simex-package
### Keywords: package models regression

### ** Examples

# See example(simex) and example(mcsimex)
## Seed
set.seed(49494)

## simulating the measurement error standard deviations
sd_me1 <- 0.3
sd_me2 <- 0.4
temp <- runif(100, min = 0, max = 0.6)
sd_me_het1 <- sort(temp)
temp2 <- rnorm(100, sd = 0.1)
sd_me_het2 <- abs(sd_me_het1 + temp2)

## simulating the independent variables x (real and with measurement error):
x_real1 <- rnorm(100)
x_real2 <- rpois(100, lambda = 2)
x_real3 <- -4*x_real1 + runif(100, min = -2, max = 2)  # correlated to x_real

x_measured1 <- x_real1 + sd_me1 * rnorm(100)
x_measured2 <- x_real2 + sd_me2 * rnorm(100)
x_het1 <- x_real1 + sd_me_het1 * rnorm(100)
x_het2 <- x_real3 + sd_me_het2 * rnorm(100)

## calculating dependent variable y:
y1  <- x_real1 + rnorm(100, sd = 0.05)
y2 <- x_real1 + 2*x_real2 + rnorm(100, sd = 0.08)
y3 <- x_real1 + 2*x_real3 + rnorm(100, sd = 0.08)


### one variable with homoscedastic measurement error
(model_real <- lm(y1  ~ x_real1))

(model_naiv <- lm(y1  ~ x_measured1, x = TRUE))

(model_simex <- simex(model_naiv, SIMEXvariable = "x_measured1", measurement.error = sd_me1))
plot(model_simex)


### two variables with homoscedastic measurement errors
(model_real2 <- lm(y2 ~ x_real1 + x_real2))

(model_naiv2 <- lm(y2 ~ x_measured1 + x_measured2, x = TRUE))

(model_simex2 <- simex(model_naiv2, SIMEXvariable = c("x_measured1", "x_measured2"), 
                       measurement.error = cbind(sd_me1, sd_me2)))

plot(model_simex2)


### one variable with increasing heteroscedastic measurement error
model_real 

(mod_naiv1 <- lm(y1  ~ x_het1, x = TRUE))

(mod_simex1 <- simex(mod_naiv1, SIMEXvariable = "x_het1",
     measurement.error = sd_me_het1, asymptotic = FALSE))

plot(mod_simex1)

## Not run: 
##D ### two correlated variables with heteroscedastic measurement errors
##D (model_real3 <- lm(y3 ~ x_real1 + x_real3))
##D 
##D (mod_naiv2 <- lm(y3 ~ x_het1 + x_het2, x = TRUE))
##D 
##D (mod_simex2 <- simex(mod_naiv2, SIMEXvariable = c("x_het1", "x_het2"), 
##D                      measurement.error = cbind(sd_me_het1, sd_me_het2), asymptotic = FALSE))
##D plot(mod_simex2)
##D 
##D 
##D ### two variables, one with homoscedastic, one with heteroscedastic measurement error
##D model_real2
##D 
##D (mod_naiv3 <- lm(y2 ~ x_measured1 + x_het2, x = TRUE))
##D 
##D (mod_simex3 <- simex(mod_naiv3, SIMEXvariable = c("x_measured1", "x_het2"), 
##D                      measurement.error = cbind(sd_me1, sd_me_het2), asymptotic = FALSE))
##D 
##D 
##D ### glm: two variables, one with homoscedastic, one with heteroscedastic measurement error
##D t <- x_real1 + 2*x_real2 
##D g <- 1 / (1 + exp(-t))
##D u <- runif(100)
##D ybin <- as.numeric(u < g)
##D 
##D 
##D (logit_real <- glm(ybin ~ x_real1 + x_real2, family = binomial))
##D 
##D (logit_naiv <- glm(ybin ~ x_measured1 + x_het2, x = TRUE, family = binomial))
##D 
##D (logit_simex <- simex(logit_naiv, SIMEXvariable = c("x_measured1", "x_het2"), 
##D                       measurement.error = cbind(sd_me1, sd_me_het2), asymptotic = FALSE))
##D summary(logit_simex)
##D print(logit_simex)
##D plot(logit_simex)
## End(Not run)



