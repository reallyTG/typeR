library(jstable)


### Name: cox2.display
### Title: cox2.display: table for coxph.object with model option: TRUE -
###   allow "frailty" or "cluster" model
### Aliases: cox2.display

### ** Examples

 library(survival);data(lung)
 fit1 <- coxph(Surv(time, status) ~ ph.ecog + age + cluster(inst), data = lung, model = TRUE)
 fit2 <- coxph(Surv(time, status) ~ ph.ecog + age + frailty(inst), data = lung, model = TRUE)
 cox2.display(fit1)
 cox2.display(fit2)



