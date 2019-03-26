library(jstable)


### Name: LabeljsTable
### Title: LabeljsTable: Apply label information to jstable object using
###   label data
### Aliases: LabeljsTable

### ** Examples

 library(coxme)
 fit <- coxme(Surv(time, status) ~ sex + ph.ecog + ph.karno + (1|inst) +(1|sex), lung)
 fit.table <- coxme.display(fit)
 lung.label <- mk.lev(lung)
 LabeljsTable(fit.table$table, ref = lung.label)



