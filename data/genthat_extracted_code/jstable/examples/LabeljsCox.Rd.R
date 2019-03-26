library(jstable)


### Name: LabeljsCox
### Title: LabeljsCox: Apply label information to cox2.display object using
###   label data
### Aliases: LabeljsCox

### ** Examples

 library(survival)
 fit <- coxph(Surv(time, status) ~ sex + ph.ecog + ph.karno + cluster(inst), 
               data = lung, model = TRUE)
 fit.table <- cox2.display(fit)
 lung.label <- mk.lev(lung)
 LabeljsCox(fit.table, ref = lung.label)



