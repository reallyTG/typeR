library(moonBook)


### Name: mycph
### Title: Perform coxph of individual expecting variables
### Aliases: mycph

### ** Examples

require(survival)
data(colon)
attach(colon)
colon$TS=Surv(time,status==1)
out=mycph(TS~.,data=colon)
out
HRplot(out,type=2,show.CI=TRUE,main="Hazard ratios of all individual variables")



