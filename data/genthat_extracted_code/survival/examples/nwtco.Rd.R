library(survival)


### Name: nwtco
### Title: Data from the National Wilm's Tumor Study
### Aliases: nwtco
### Keywords: datasets

### ** Examples

with(nwtco, table(instit,histol))
anova(coxph(Surv(edrel,rel)~histol+instit,data=nwtco))
anova(coxph(Surv(edrel,rel)~instit+histol,data=nwtco))



