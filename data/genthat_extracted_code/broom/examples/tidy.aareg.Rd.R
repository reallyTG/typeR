library(broom)


### Name: tidy.aareg
### Title: Tidy a(n) aareg object
### Aliases: tidy.aareg aareg_tidiers

### ** Examples


library(survival)

afit <- aareg(
  Surv(time, status) ~ age + sex + ph.ecog,
  data = lung,
  dfbeta = TRUE
)

tidy(afit) 




