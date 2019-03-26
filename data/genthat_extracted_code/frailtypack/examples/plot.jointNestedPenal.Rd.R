library(frailtypack)


### Name: plot.jointNestedPenal
### Title: Plot method for a joint nested frailty model.
### Aliases: plot.jointNestedPenal lines.jointNestedPenal
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
##D ~ subcluster(id) + cluster(group) + dukes + terminal(death), 
##D formula.terminalEvent = ~dukes, data = readmissionNested, recurrentAG = TRUE,
##D  n.knots = 8, kappa = c(9.55e+9, 1.41e+12),initialize = TRUE)
##D 
##D # Plot the estimated baseline hazard function with the confidence intervals
##D plot(model.spli.AG)	
##D 
##D # Plot the estimated baseline hazard function with the confidence intervals
##D plot(model.spli.RE, type = "Survival")
##D 	
## End(Not run)




