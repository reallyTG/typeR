library(tram)


### Name: Coxph
### Title: Cox Proportional Hazards Model
### Aliases: Coxph
### Keywords: models regression survival smooth

### ** Examples


  data("GBSG2", package = "TH.data")

  library("survival")
  coxph(Surv(time, cens) ~ horTh, data = GBSG2)

  Coxph(Surv(time, cens) ~ horTh, data = GBSG2)




