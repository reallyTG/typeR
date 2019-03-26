library(VGAM)


### Name: VGAM-package
### Title: Vector Generalized Linear and Additive Models and Associated
###   Models
### Aliases: VGAM-package VGAM
### Keywords: package models regression

### ** Examples

# Example 1; proportional odds model
pneumo <- transform(pneumo, let = log(exposure.time))
(fit1 <- vglm(cbind(normal, mild, severe) ~ let, propodds, data = pneumo))
depvar(fit1)  # Better than using fit1@y; dependent variable (response)
weights(fit1, type = "prior")  # Number of observations
coef(fit1, matrix = TRUE)      # p.179, in McCullagh and Nelder (1989)
constraints(fit1)              # Constraint matrices
summary(fit1)  # HDE could affect these results
summary(fit1, lrt0 = TRUE, score0 = TRUE, wald0 = TRUE)  # No HDE
hdeff(fit1)  # Check for any Hauck-Donner effect

# Example 2; zero-inflated Poisson model
zdata <- data.frame(x2 = runif(nn <- 2000))
zdata <- transform(zdata, pstr0  = logit(-0.5 + 1*x2, inverse = TRUE),
                          lambda = loge(  0.5 + 2*x2, inverse = TRUE))
zdata <- transform(zdata, y = rzipois(nn, lambda, pstr0 = pstr0))
with(zdata, table(y))
fit2 <- vglm(y ~ x2, zipoisson, data = zdata, trace = TRUE)
coef(fit2, matrix = TRUE)  # These should agree with the above values


# Example 3; fit a two species GAM simultaneously
fit3 <- vgam(cbind(agaaus, kniexc) ~ s(altitude, df = c(2, 3)),
             binomialff(multiple.responses = TRUE), data = hunua)
coef(fit3, matrix = TRUE)   # Not really interpretable
## Not run: 
##D  plot(fit3, se = TRUE, overlay = TRUE, lcol = 3:4, scol = 3:4)
##D 
##D ooo <- with(hunua, order(altitude))
##D with(hunua,  matplot(altitude[ooo], fitted(fit3)[ooo, ], type = "l",
##D      lwd = 2, col = 3:4,
##D      xlab = "Altitude (m)", ylab = "Probability of presence", las = 1,
##D      main = "Two plant species' response curves", ylim = c(0, 0.8)))
##D with(hunua, rug(altitude)) 
## End(Not run)


# Example 4; LMS quantile regression
fit4 <- vgam(BMI ~ s(age, df = c(4, 2)), lms.bcn(zero = 1),
             data = bmi.nz, trace = TRUE)
head(predict(fit4))
head(fitted(fit4))
head(bmi.nz)  # Person 1 is near the lower quartile among people his age
head(cdf(fit4))

## Not run: 
##D  par(mfrow = c(1,1), bty = "l", mar = c(5,4,4,3)+0.1, xpd=TRUE)
##D qtplot(fit4, percentiles = c(5,50,90,99), main = "Quantiles", las = 1,
##D        xlim = c(15, 90), ylab = "BMI", lwd=2, lcol=4)  # Quantile plot
##D 
##D ygrid <- seq(15, 43, len = 100)  # BMI ranges
##D par(mfrow = c(1, 1), lwd = 2)  # Density plot
##D aa <- deplot(fit4, x0 = 20, y = ygrid, xlab = "BMI", col = "black",
##D     main = "Density functions at Age=20 (black), 42 (red) and 55 (blue)")
##D aa
##D aa <- deplot(fit4, x0 = 42, y = ygrid, add = TRUE, llty = 2, col = "red")
##D aa <- deplot(fit4, x0 = 55, y = ygrid, add = TRUE, llty = 4, col = "blue",
##D             Attach = TRUE)
##D aa@post$deplot  # Contains density function values
## End(Not run)


# Example 5; GEV distribution for extremes
(fit5 <- vglm(maxtemp ~ 1, gevff, data = oxtemp, trace = TRUE))
head(fitted(fit5))
coef(fit5, matrix = TRUE)
Coef(fit5)
vcov(fit5)
vcov(fit5, untransform = TRUE)
sqrt(diag(vcov(fit5)))  # Approximate standard errors
## Not run:  rlplot(fit5) 



