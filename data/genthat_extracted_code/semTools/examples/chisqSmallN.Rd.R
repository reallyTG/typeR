library(semTools)


### Name: chisqSmallN
### Title: _k_-factor correction for chi^2 test statistic
### Aliases: chisqSmallN

### ** Examples


HS.model <- '
    visual  =~ x1 + b1*x2 + x3
    textual =~ x4 + b2*x5 + x6
    speed   =~ x7 + b3*x8 + x9
'
fit1 <- cfa(HS.model, data = HolzingerSwineford1939)
## test a single model (implicitly compared to a saturated model)
chisqSmallN(fit1)

## fit a more constrained model
fit0 <- cfa(HS.model, data = HolzingerSwineford1939, orthogonal = TRUE)
## compare 2 models
chisqSmallN(fit1, fit0)




