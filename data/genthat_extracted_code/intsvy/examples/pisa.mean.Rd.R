library(intsvy)


### Name: pisa.mean
### Title: Calculates mean of variable
### Aliases: pisa.mean pisa2015.mean

### ** Examples

## Not run: 
##D # PISA 2012: Table II.2.3, p. 183
##D pisa.mean(variable="ESCS", by="IDCNTRYL", data=pisa)
##D pisa.mean(variable="PARED", by="IDCNTRYL", data=pisa)
##D 
##D # PISA 2012: Table III.2.3d, p. 252
##D pisa.mean(variable="BELONG", by="IDCNTRYL", data=pisa)
##D pisa.mean(variable="BELONG", by=c("IDCNTRYL", "ST04Q01"), data=pisa)
##D 
##D # PISA 2015
##D pisa2015.mean(variable="AGE", by="CNT", data=stud2015)
## End(Not run)



