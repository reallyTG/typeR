library(lmerTest)


### Name: contestMD.lmerModLmerTest
### Title: Multiple Degrees-of-Freedom Contrast Tests
### Aliases: contestMD.lmerModLmerTest calcSatterth contestMD.lmerMod

### ** Examples


data("sleepstudy", package="lme4")
fm <- lmer(Reaction ~ Days + I(Days^2) + (1|Subject) + (0+Days|Subject),
           sleepstudy)

# Define 2-df contrast - since L has 2 (linearly independent) rows
# the F-test is on 2 (numerator) df:
L <- rbind(c(0, 1, 0), # Note: ncol(L) == length(fixef(fm))
           c(0, 0, 1))

# Make the 2-df F-test of any effect of Days:
contestMD(fm, L)

# Illustrate rhs argument:
contestMD(fm, L, rhs=c(5, .1))

# Make the 1-df F-test of the effect of Days^2:
contestMD(fm, L[2, , drop=FALSE])
# Same test, but now as a t-test instead:
contest1D(fm, L[2, , drop=TRUE])




