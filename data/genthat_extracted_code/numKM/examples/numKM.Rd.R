library(numKM)


### Name: numKM
### Title: Create a Kaplan-Meier Plot with Numbers at Risk
### Aliases: numKM

### ** Examples

require("survival")
data(colon)
fit <- survfit(Surv(time,status)~rx, data=colon)
numKM(sfit=fit,timeby=500)



