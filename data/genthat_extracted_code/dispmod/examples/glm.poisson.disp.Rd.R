library(dispmod)


### Name: glm.poisson.disp
### Title: Overdispersed Poisson log-linear models
### Aliases: glm.poisson.disp
### Keywords: models regression

### ** Examples

## Salmonella TA98 data
data(salmonellaTA98)
salmonellaTA98 <- within(salmonellaTA98, logx10 <- log(x+10))
mod <- glm(y ~ logx10 + x, data = salmonellaTA98, family = poisson(log)) 
summary(mod)

mod.disp <- glm.poisson.disp(mod)
summary(mod.disp)
mod.disp$dispersion

# compute predictions on a grid of x-values...
x0 <- with(salmonellaTA98, seq(min(x), max(x), length=50))
eta0 <- predict(mod, newdata = data.frame(logx10 = log(x0+10), x = x0), se=TRUE)
eta0.disp <- predict(mod.disp, newdata = data.frame(logx10 = log(x0+10), x = x0), se=TRUE)
# ... and plot the mean functions with variability bands
plot(y ~ x, data = salmonellaTA98)
lines(x0, exp(eta0$fit))
lines(x0, exp(eta0$fit+2*eta0$se), lty=2)
lines(x0, exp(eta0$fit-2*eta0$se), lty=2)
lines(x0, exp(eta0.disp$fit), col=3)
lines(x0, exp(eta0.disp$fit+2*eta0.disp$se), lty=2, col=3)
lines(x0, exp(eta0.disp$fit-2*eta0.disp$se), lty=2, col=3)

## Holford's data
data(holford)

mod <- glm(incid ~ offset(log(pop)) + Age + Cohort, data = holford, 
           family = poisson(log)) 
summary(mod)

mod.disp <- glm.poisson.disp(mod)
summary(mod.disp)
mod.disp$dispersion



