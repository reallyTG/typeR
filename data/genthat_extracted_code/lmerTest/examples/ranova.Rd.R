library(lmerTest)


### Name: ranova
### Title: ANOVA-Like Table for Random-Effects
### Aliases: ranova rand

### ** Examples


# Test reduction of (Days | Subject) to (1 | Subject):
fm1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)
ranova(fm1) # 2 df test

# This test can also be achieved with anova():
fm2 <- lmer(Reaction ~ Days + (1|Subject), sleepstudy)
anova(fm1, fm2, refit=FALSE)

# Illustrate reduce.test argument:
# Test removal of (Days | Subject):
ranova(fm1, reduce.terms = FALSE) # 3 df test

# The likelihood ratio test statistic is in this case:
fm3 <- lm(Reaction ~ Days, sleepstudy)
2*c(logLik(fm1, REML=TRUE) - logLik(fm3, REML=TRUE)) # LRT

# anova() is not always able to perform the same tests as ranova(),
# for example:
anova(fm1, fm3, refit=FALSE) # compares REML with ML and should not be used
anova(fm1, fm3, refit=TRUE) # is a test of ML fits and not what we seek

# Also note that the lmer-fit needs to come first - not an lm-fit:
# anova(fm3, fm1) # does not work and gives an error

# ranova() may not generate all relevant test:
# For the following model ranova() indicates that we should not reduce
# (TVset | Assessor):
fm <- lmer(Coloursaturation ~ TVset * Picture + (TVset | Assessor), data=TVbo)
ranova(fm)
# However, a more appropriate model is:
fm2 <- lmer(Coloursaturation ~ TVset * Picture + (1 | TVset:Assessor), data=TVbo)
anova(fm, fm2, refit=FALSE)
# fm and fm2 has essentially the same fit to data but fm uses 5 parameters
# more than fm.




