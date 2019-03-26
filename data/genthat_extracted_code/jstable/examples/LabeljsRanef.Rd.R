library(jstable)


### Name: LabeljsRanef
### Title: LabeljsRanef: Apply label information to jstable random effect
###   object using label data
### Aliases: LabeljsRanef

### ** Examples

 library(coxme)
 fit <- coxme(Surv(time, status) ~ sex + ph.ecog + ph.karno + (1|inst) +(1|sex), lung)
 fit.table <- coxme.display(fit)
 lung.label <- mk.lev(lung)
 LabeljsTable(fit.table$table, ref = lung.label)
 LabeljsRanef(fit.table$ranef, ref = lung.label)



