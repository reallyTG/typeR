library(survival)


### Name: summary.survfit
### Title: Summary of a Survival Curve
### Aliases: summary.survfit
### Keywords: survival

### ** Examples

summary( survfit( Surv(futime, fustat)~1, data=ovarian))
summary( survfit( Surv(futime, fustat)~rx, data=ovarian))



