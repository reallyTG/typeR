library(betas)


### Name: betas.lm
### Title: Compute standardized beta coeffizients for linear regression
###   models
### Aliases: betas.lm

### ** Examples

data <- pisa2012che

## linear regression models with numerical covariates only
fit1 <- lm(MATH ~ ESCS + USEMATH, data)
betas.lm(fit1)

## ...and with interaction terms
fit1.1 <- lm(MATH ~ ESCS * USEMATH, data)
betas.lm(fit1.1)

## linear regression models with numerical and factorial covariates
fit2 <- lm(MATH ~ ESCS + USEMATH + ST04Q01 + FAMSTRUC + ST28Q01, data)
betas.lm(fit2)

## ...and with interaction terms
fit2.1 <- lm(MATH ~ ESCS + USEMATH + ST04Q01 + FAMSTRUC * ST28Q01, data)
betas.lm(fit2.1)

## weighted linear regression models
fit3 <- lm(MATH ~ ESCS + USEMATH, data, weights = W_FSTUWT)
betas.lm(fit3)

fit4 <- lm(MATH ~ ESCS + USEMATH + ST04Q01 + FAMSTRUC + ST28Q01, data, weights = W_FSTUWT)
betas.lm(fit4)

## ...with interaction terms
fit3.1 <- lm(MATH ~ ESCS * USEMATH, data, weights = W_FSTUWT)
betas.lm(fit3.1)

fit4.1 <- lm(MATH ~ ESCS + USEMATH + ST04Q01 + FAMSTRUC * ST28Q01, data, weights = W_FSTUWT)
betas.lm(fit4.1)



