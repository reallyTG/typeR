library(nutshell)


### Name: GSE2034
### Title: Breast cancer relapse free survival
### Aliases: GSE2034
### Keywords: datasets

### ** Examples

data(GSE2034)
library(survival)
GSE2034.Surv <- transform(GSE2034,
  surv=Surv(
    time=GSE2034$months.to.relapse.or.last.followup,
    event=GSE2034$relapse,
    type="right"
    )
  )
GSE2034.survfit <- survfit(
  formula=surv~ER.Status,
  data=GSE2034.Surv )
plot(GSE2034.survfit,lty=1:2)
legend(135,1,c("ER+","ER-"),lty=1:2,cex=0.5)



