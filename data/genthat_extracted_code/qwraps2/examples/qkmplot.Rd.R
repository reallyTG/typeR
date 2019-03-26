library(qwraps2)


### Name: qkmplot
### Title: Kaplan-Meier Plot
### Aliases: qkmplot qkmplot_bulid_data_frame

### ** Examples

require(survival)
leukemia.surv <- survival::survfit(survival::Surv(time, status) ~ x, data = survival::aml) 
survival:::plot.survfit(leukemia.surv, conf.int = TRUE, lty = 2:3, col = 1:2)

qkmplot_bulid_data_frame(leukemia.surv) 
qkmplot(leukemia.surv, conf_int = TRUE) 

intonly_fit <- survival::survfit(survival::Surv(time, status) ~ 1, data = survival::aml) 
survival:::plot.survfit(intonly_fit, conf.int = TRUE)

qkmplot_bulid_data_frame(intonly_fit) 
qkmplot(intonly_fit, conf_int = TRUE) 



