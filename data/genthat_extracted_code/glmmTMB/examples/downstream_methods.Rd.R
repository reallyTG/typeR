library(glmmTMB)


### Name: Anova.glmmTMB
### Title: Downstream methods for glmmTMB objects
### Aliases: Anova.glmmTMB Effect.glmmTMB recover_data.glmmTMB
###   emm_basis.glmmTMB downstream_methods

### ** Examples

warp.lm <- glmmTMB(breaks ~ wool * tension, data = warpbreaks)
if (require(emmeans)) {
    emmeans (warp.lm, poly ~ tension | wool)
}
if (require(car)) {
    Anova(warp.lm,type="III")
}
if (require(effects)) {
    plot(allEffects(warp.lm))
}



