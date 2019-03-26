library(intsvy)


### Name: pisa.mean.pv
### Title: Calculates mean achievement score
### Aliases: pisa.mean.pv pisa2015.mean.pv

### ** Examples

## Not run: 
##D # Table I.2.3a, p. 305 International Report 2012 
##D pisa.mean.pv(pvlabel = "MATH", by = "IDCNTRYL", data = pisa)
##D pisa.mean.pv(pvlabel = "MATH", by = c("IDCNTRYL", "ST04Q01"), data = pisa)
##D 
##D # Table III.2.1a, p. 232, International Report 2012
##D pisa.mean.pv(pvlabel="MATH", by=c("IDCNTRYL", "ST08Q01"), data=pisa)
##D 
##D # Figure I.2.16 p. 56 International Report 2009
##D pisa.mean.pv(pvlabel = "READ", by = "IDCNTRYL", data = pisa)
##D 
##D # PISA 2015
##D pisa2015.mean.pv(pvlabel = "READ", by = "CNT", data = stud2015)
##D 
## End(Not run)



