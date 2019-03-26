library(frailtypack)


### Name: summary.jointNestedPenal
### Title: summary of parameter estimates of a joint nested frailty model
### Aliases: summary.jointNestedPenal print.summary.jointNestedPenal
### Keywords: methods

### ** Examples



## Not run: 
##D 
##D #-- here is generated cluster (30 clusters)
##D readmissionNested <- transform(readmission,group=id%%30+1)
##D 
##D # Baseline hazard function approximated with splines with calendar-timescale
##D 
##D model.spli.AG <- frailtyPenal(formula = Surv(t.start, t.stop, event)
##D  ~ subcluster(id) + cluster(group) + dukes + terminal(death), 
##D  formula.terminalEvent = ~dukes, data = readmissionNested, 
##D  recurrentAG = TRUE, n.knots = 8, kappa = c(9.55e+9, 1.41e+12),
##D  initialize = TRUE)
##D 
##D summary(model.spli.AG)
##D 
## End(Not run)




