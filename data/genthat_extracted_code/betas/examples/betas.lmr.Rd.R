library(betas)


### Name: betas.lmr
### Title: Compute standardized beta coeffizients for robust linear
###   regression models
### Aliases: betas.lmr

### ** Examples

library(robust)
data <- pisa2012che

## robust estimation of betas
fit1 <- lmRob(MATH ~ ESCS, data)
betas.lmr(fit1)

## example where robust variance cannot be computed,
## instead the classical variance is used.
fit2 <- lmRob(MATH ~ ESCS + USEMATH, data)
betas.lmr(fit2)



