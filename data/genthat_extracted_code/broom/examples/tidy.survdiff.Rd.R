library(broom)


### Name: tidy.survdiff
### Title: Tidy a(n) survdiff object
### Aliases: tidy.survdiff survdiff_tidiers

### ** Examples


library(survival)

s <- survdiff(
  Surv(time, status) ~ pat.karno + strata(inst),
  data = lung
)

tidy(s)
glance(s)




