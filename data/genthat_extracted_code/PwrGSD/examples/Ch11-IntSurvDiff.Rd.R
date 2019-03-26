library(PwrGSD)


### Name: IntSurvDiff
### Title: Weighted Integrated Survival function test
### Aliases: IntSurvDiff
### Keywords: survival

### ** Examples

  library(PwrGSD)
  data(lung)
  fit.isd<-IntSurvDiff(Surv(time,I(status==2))~I(sex==2), data=lung, WtFun="SFH", param=c(0,1,300))



