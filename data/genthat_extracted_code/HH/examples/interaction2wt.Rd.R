library(HH)


### Name: interaction2wt
### Title: Plot all main effects and twoway interactions in a multifactor
###   design
### Aliases: interaction2wt interaction2wt.formula interaction2wt.default
### Keywords: hplot design

### ** Examples

data(vulcan)
interaction2wt(wear ~ filler + pretreat + raw, data=vulcan,
               par.strip.text=list(cex=.7))
interaction2wt(wear ~ filler + pretreat + raw, data=vulcan)
interaction2wt(wear ~ filler + raw, data=vulcan,
               simple=TRUE)
interaction2wt(wear ~ filler + raw, data=vulcan,
               simple=TRUE, simple.scale=c(filler=.15, raw=.2),
               xlim=c(.3, 5.6))

ToothGrowth$dose <- positioned(ToothGrowth$dose) ## modify local copy
anova(aov(len ~ supp*dose, data=ToothGrowth))
interaction2wt(len ~ supp + dose, data=ToothGrowth)


esoph$rate=with(esoph, ncases/ncontrols) ## modify local copy

position(esoph$alcgp) <- 2:5
position(esoph$tobgp) <- 2:5

interaction2wt(rate ~ agegp + alcgp + tobgp, esoph, rot=c(90,0),
                 par.strip.text=list(cex=.8))

interaction2wt(rate ~ agegp + alcgp + tobgp, esoph, rot=c(90,0),
               par.strip.text=list(cex=.8),
               factor.expressions=c(
                 agegp=expression(Age~~(years)),
                 alcgp=expression(Alcohol~
                   bgroup("(",scriptstyle(frac(gm, day)),")")),
                 tobgp=expression(Tobacco~
                   bgroup("(",scriptstyle(frac(gm, day)),")"))),
               par.settings=list(
                 par.xlab.text=list(cex=.8),
                 par.ylab.text=list(cex=.8)),
               responselab.expression="Cancer\nRate",
               main=list(
"Esophogeal Cancer Rate ~ Alcohol Consumption + Tobacco Consumption",
                 cex=1.2))

esoph.aov <- aov(rate ~ agegp + alcgp + tobgp, data=esoph)
anova(esoph.aov)




