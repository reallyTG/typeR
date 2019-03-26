library(pbkrtest)


### Name: kr-modcomp
### Title: Ftest and degrees of freedom based on Kenward-Roger
###   approximation
### Aliases: KRmodcomp KRmodcomp.lmerMod KRmodcomp.mer KRmodcomp_internal
###   kr-modcomp
### Keywords: inference models

### ** Examples


(fmLarge <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy))
## removing Days
(fmSmall <- lmer(Reaction ~ 1 + (Days|Subject), sleepstudy))
anova(fmLarge,fmSmall)
KRmodcomp(fmLarge,fmSmall)

## The same test using a restriction matrix
L <- cbind(0,1)
KRmodcomp(fmLarge, L)

## Same example, but with independent intercept and slope effects:
m.large  <- lmer(Reaction ~ Days + (1|Subject) + (0+Days|Subject), data = sleepstudy)
m.small  <- lmer(Reaction ~ 1 + (1|Subject) + (0+Days|Subject), data = sleepstudy)
anova(m.large, m.small)
KRmodcomp(m.large, m.small)





