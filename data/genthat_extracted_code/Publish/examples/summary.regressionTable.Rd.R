library(Publish)


### Name: summary.regressionTable
### Title: Formatting regression tables
### Aliases: summary.regressionTable print.summary.regressionTable

### ** Examples

library(survival)
data(pbc)
pbc$edema <- factor(pbc$edema,levels=c("0","0.5","1"),labels=c("0","0.5","1"))
fit = coxph(Surv(time,status!=0)~age+sex+edema+log(bili)+log(albumin)+log(protime),
            data=pbc)
u=summary(regressionTable(fit))
u$regressionTable
u$rawTable
summary(regressionTable(fit),handler="prettyNum")
summary(regressionTable(fit),handler="format")
summary(regressionTable(fit),handler="sprintf",digits=c(2,2),pValue.stars=TRUE)



