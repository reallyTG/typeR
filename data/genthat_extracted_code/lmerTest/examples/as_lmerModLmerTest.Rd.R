library(lmerTest)


### Name: as_lmerModLmerTest
### Title: Coerce lmerMod Objects to lmerModLmerTest
### Aliases: as_lmerModLmerTest

### ** Examples

m <- lme4::lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
bm <- as_lmerModLmerTest(m)
slotNames(bm)




