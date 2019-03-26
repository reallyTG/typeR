library(lme4)


### Name: influence.merMod
### Title: Influence Diagnostics for Mixed-Effects Models
### Aliases: influence.merMod dfbeta.influence.merMod
###   dfbetas.influence.merMod cooks.distance.influence.merMod
###   cooks.distance.merMod
### Keywords: models

### ** Examples

fm1 <- lmer(Reaction ~ Days + (Days | Subject), sleepstudy)
inf_fm1 <- influence(fm1, "Subject")
if (require("car")) {
    infIndexPlot(inf_fm1)
}
dfbeta(inf_fm1)
dfbetas(inf_fm1)
gm1 <- glmer(cbind(incidence, size - incidence) ~ period + (1 | herd),
             data = cbpp, family = binomial)
inf_gm1 <- influence(gm1, "herd", maxfun=100)
gm1.11 <- update(gm1, subset = herd != 11) # check deleting herd 11
if (require("car")) {
    infIndexPlot(inf_gm1)
    compareCoefs(gm1, gm1.11)
}
## FIXME: dfbetas will fail at present *if* car is available, because
##  influence.merMod and dfbetas.influence.merMod methods are being
##  gotten from car, which has a sqrt(diag(x)) applied to a dpoMatrix ...
## dfbeta(inf_gm1)
## dfbetas(inf_gm1)



