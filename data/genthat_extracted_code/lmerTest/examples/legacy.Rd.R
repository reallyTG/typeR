library(lmerTest)


### Name: anova.merModLmerTest
### Title: Methods for Legacy lmerTest Objects
### Aliases: anova.merModLmerTest legacy summary.merModLmerTest
###   ls_means.merModLmerTest lsmeansLT.merModLmerTest
###   difflsmeans.merModLmerTest drop1.merModLmerTest step.merModLmerTest
### Keywords: internal

### ** Examples

# Load model fits fm1 and fm2 generated with lmerTest version 2.3-37:
load(system.file("testdata","legacy_fits.RData", package="lmerTest"))

# Apply some methods defined by lmerTest:
anova(fm1)
summary(fm1)
contest(fm1, c(0, 1))
contest(fm1, c(0, 1), joint=FALSE)
drop1(fm1)
ranova(fm1)

# lme4-methods also work:
fixef(fm1)

# Ditto for second model fit:
anova(fm2)
summary(fm2)
ls_means(fm2)
difflsmeans(fm2)



