library(jstable)


### Name: LabeljsMixed
### Title: LabeljsMixed: Apply label information to jstable object using
###   label data
### Aliases: LabeljsMixed

### ** Examples

 library(coxme)
 fit <- coxme(Surv(time, status) ~ sex + ph.ecog + ph.karno + (1|inst) +(1|sex), lung)
 fit.table <- coxme.display(fit)
 lung.label <- mk.lev(lung)
 LabeljsMixed(fit.table, ref = lung.label)



