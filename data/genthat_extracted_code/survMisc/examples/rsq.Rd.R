library(survMisc)


### Name: rsq
### Title: r^2 measures for a a 'coxph' or 'survfit' model
### Aliases: rsq rsq.coxph rsq.survfit

### ** Examples

data("kidney", package="KMsurv")
c1 <- coxph(Surv(time=time, event=delta) ~ type, data=kidney)
cbind(rsq(c1), rsq(c1, sigD=NULL))




