library(pbkrtest)


### Name: get_ddf_Lb
### Title: Adjusted denomintor degress freedom for linear estimate for
###   linear mixed model.
### Aliases: Lb_ddf ddf_Lb get_Lb_ddf get_Lb_ddf.lmerMod get_ddf_Lb
###   get_ddf_Lb.lmerMod
### Keywords: inference models

### ** Examples


(fmLarge <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy))
## removing Days
(fmSmall <- lmer(Reaction ~ 1 + (Days|Subject), sleepstudy))
anova(fmLarge,fmSmall)

KRmodcomp(fmLarge, fmSmall)  ## 17 denominator df's
get_Lb_ddf(fmLarge, c(0,1)) ## 17 denominator df's

# Notice: The restriction matrix L corresponding to the test above
# can be found with
L <- model2restrictionMatrix(fmLarge, fmSmall)
L




