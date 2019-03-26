library(WRTDStidal)


### Name: goodfit
### Title: Quantile regression goodness of fit
### Aliases: goodfit

### ** Examples


library(quantreg)

## random variables
x <- runif(100, 0, 10)
y <- x + rnorm(100)

## quantile model
mod <- rq(y ~ x, tau = 0.5)
res <- resid(mod)

## non-conditional quantile model
mod_nl <- rq(y ~ 1, tau = 0.5)
rsd_nl <- resid(mod_nl)

goodfit(res, rsd_nl, 0.5)

## r2 of mean model for comparison
mod_lm <- lm(y ~ x)

summary(mod_lm)$r.squared



