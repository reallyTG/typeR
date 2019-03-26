library(car)


### Name: influence.mixed.models
### Title: Influence Diagnostics for Mixed-Effects Models
### Aliases: influence.mixed.models influence.merMod influence.lme
###   cooks.distance.influence.merMod cooks.distance.influence.lme
###   dfbeta.influence.merMod dfbeta.influence.lme dfbetas.influence.merMod
###   dfbetas.influence.lme
### Keywords: models

### ** Examples

if (require("lme4")){
    print(fm1 <- lmer(Reaction ~ Days + (Days | Subject),
        sleepstudy)) # from ?lmer
    infIndexPlot(influence(fm1, "Subject"))
    }
if (require("lme4")){
    gm1 <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
        data = cbpp, family = binomial)
    infIndexPlot(influence(gm1, "herd", maxfun=100))
    gm1.11 <- update(gm1, subset = herd != 11) # check deleting herd 11
    compareCoefs(gm1, gm1.11)
    }



