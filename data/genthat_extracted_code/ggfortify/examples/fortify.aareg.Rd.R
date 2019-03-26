library(ggfortify)


### Name: fortify.aareg
### Title: Convert 'survival::aareg' to 'data.frame'
### Aliases: fortify.aareg

### ** Examples

library(survival)
fortify(aareg(Surv(time, status) ~ age + sex + ph.ecog, data = lung, nmin = 1))
fortify(aareg(Surv(time, status) ~ age + sex + ph.ecog, data = lung, nmin = 1), melt = TRUE)



