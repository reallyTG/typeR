library(intsvy)


### Name: plot.intsvy.reg
### Title: Graphical representation of regression models in groups
### Aliases: plot.intsvy.reg

### ** Examples

## Not run: 
##D # Independent variables
##D x.vars <- c("ESCS", "COGACT", "TCHBEHTD", "TCHBEHSO")
##D # Model estimation
##D my.mod <- pisa.reg.pv(pvlabel="MATH", x=x.vars, by="IDCNTRYL", data=pisa12)
##D # Plot
##D plot(gen.mod, vars = c("COGACT", "TCHBEHTD", "TCHBEHSO"), sort=TRUE)
## End(Not run)



