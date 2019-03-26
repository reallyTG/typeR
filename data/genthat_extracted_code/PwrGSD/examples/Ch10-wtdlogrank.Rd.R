library(PwrGSD)


### Name: wtdlogrank
### Title: Weighted log-rank test
### Aliases: wtdlogrank
### Keywords: survival

### ** Examples

  library(PwrGSD)
  data(lung)
  fit.wlr <-wtdlogrank(Surv(time, I(status==2))~I(sex==2), data=lung, WtFun="SFH", param=c(0,1,300))



