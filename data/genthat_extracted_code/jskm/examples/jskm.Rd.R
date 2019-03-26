library(jskm)


### Name: jskm
### Title: Creates a Kaplan-Meier plot for survfit object.
### Aliases: jskm

### ** Examples

 library(survival)
 data(colon)
 fit <- survfit(Surv(time,status)~rx, data=colon)
 jskm(fit, timeby=500)



