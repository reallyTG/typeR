library(dispmod)


### Name: lm.disp
### Title: Gaussian dispersion models
### Aliases: lm.disp summary.dispmod print.summary.dispmod
### Keywords: models regression

### ** Examples

data(minitab)
minitab <- within(minitab, y <- V^(1/3) )
mod <- lm(y ~ H + D, data = minitab)
summary(mod)

mod.disp1 <- lm.disp(y ~ H + D, data = minitab)
summary(mod.disp1)

mod.disp2 <- lm.disp(y ~ H + D, ~ H, data = minitab)
summary(mod.disp2)

# Likelihood ratio test
deviances <- c(mod.disp1$initial.deviance,
               mod.disp2$deviance, 
               mod.disp1$deviance)
lrt <- c(NA, abs(diff(deviances)))
cbind(deviances, lrt, p.value = 1-pchisq(lrt, 1))

# quadratic dispersion model on D (as discussed by Aitkin)
mod.disp4 <- lm.disp(y ~ H + D, ~ D + I(D^2), data = minitab)
summary(mod.disp4)

r <- mod$residuals
phi.est <- mod.disp4$var$fitted.values
plot(minitab$D, log(r^2))
lines(minitab$D, log(phi.est))



