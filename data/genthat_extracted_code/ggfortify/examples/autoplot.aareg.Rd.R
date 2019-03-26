library(ggfortify)


### Name: autoplot.aareg
### Title: Autoplot 'survival::aareg'
### Aliases: autoplot.aareg

### ** Examples

library(survival)
autoplot(aareg(Surv(time, status) ~ age + sex + ph.ecog, data = lung, nmin = 1))



