library(survminer)


### Name: ggcoxzph
### Title: Graphical Test of Proportional Hazards with ggplot2
### Aliases: ggcoxzph print.ggcoxzph

### ** Examples


library(survival)
fit <- coxph(Surv(futime, fustat) ~ age + ecog.ps + rx, data=ovarian)
cox.zph.fit <- cox.zph(fit)
# plot all variables
ggcoxzph(cox.zph.fit)
# plot all variables in specified order
ggcoxzph(cox.zph.fit, var = c("ecog.ps", "rx", "age"), font.main = 12)
# plot specified variables in specified order
ggcoxzph(cox.zph.fit, var = c("ecog.ps", "rx"), font.main = 12, caption = "Caption goes here")




