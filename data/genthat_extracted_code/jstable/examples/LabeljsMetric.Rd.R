library(jstable)


### Name: LabeljsMetric
### Title: LabeljsMetric: Apply label information to jstable metric object
###   using label data
### Aliases: LabeljsMetric

### ** Examples

 library(coxme)
 fit <- coxme(Surv(time, status) ~ sex + ph.ecog + ph.karno + (1|inst) +(1|sex), lung)
 fit.table <- coxme.display(fit)
 lung.label <- mk.lev(lung)
 LabeljsTable(fit.table$table, ref = lung.label)
 LabeljsRanef(fit.table$ranef, ref = lung.label)
 LabeljsMetric(fit.table$metric, ref = lung.label)



