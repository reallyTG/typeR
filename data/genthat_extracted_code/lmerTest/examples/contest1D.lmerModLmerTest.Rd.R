library(lmerTest)


### Name: contest1D.lmerModLmerTest
### Title: Contrast Tests in 1D
### Aliases: contest1D.lmerModLmerTest contest1D.lmerMod

### ** Examples


# Fit model using lmer with data from the lme4-package:
data("sleepstudy", package="lme4")
fm <- lmer(Reaction ~ Days + (1 + Days|Subject), sleepstudy)

# Tests and CI of model coefficients are obtained with:
contest1D(fm, c(1, 0), confint=TRUE) # Test for Intercept
contest1D(fm, c(0, 1), confint=TRUE) # Test for Days

# Tests of coefficients are also part of:
summary(fm)

# Illustrate use of rhs argument:
contest1D(fm, c(0, 1), confint=TRUE, rhs=10) # Test for Days-coef == 10





