library(tram)


### Name: Survreg
### Title: Parametric Survival Models
### Aliases: Survreg
### Keywords: models regression survival

### ** Examples


  data("GBSG2", package = "TH.data")

  library("survival")
  survreg(Surv(time, cens) ~ horTh, data = GBSG2)

  Survreg(Surv(time, cens) ~ horTh, data = GBSG2)




