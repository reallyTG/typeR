library(lmerTest)


### Name: drop1.lmerModLmerTest
### Title: Drop Marginal Terms from Model
### Aliases: drop1.lmerModLmerTest

### ** Examples


# Basic usage:
fm <- lmer(angle ~ recipe + temp + (1|recipe:replicate), cake)
drop1(fm) # Using Satterthwaite degrees of freedom
if(requireNamespace("pbkrtest", quietly = TRUE))
  drop1(fm, ddf="Kenward-Roger") # Alternative DenDF and F-test method
drop1(fm, ddf="lme4", test="Chi") # Asymptotic Likelihood ratio tests

# Consider a rank-deficient design matrix:
fm <- lmer(angle ~ recipe + temp + temperature + (1|recipe:replicate), cake)
# Here temp accounts for the linear effect of temperature, and
# temperature is an (ordered) factor that accounts for the remaining
# variation between temperatures (4 df).
drop1(fm)
# While temperature is in the model, we cannot test the effect of dropping
# temp. After removing temperature we can test the effect of dropping temp:
drop1(lmer(angle ~ recipe + temp + (1|recipe:replicate), cake))

# Polynomials:
# Note that linear terms should usually not be dropped before squared terms.
# Therefore 'Days' should not be dropped before 'I(Days^2)' despite it being
# tested here:
fm <- lmer(Reaction ~ Days + I(Days^2) + (Days|Subject), sleepstudy)
drop1(fm)
# Using poly() provides a test of the whole polynomial structure - not a
# separate test for the highest order (squared) term:
fm <- lmer(Reaction ~ poly(Days, 2) + (Days|Subject), sleepstudy)
drop1(fm)




