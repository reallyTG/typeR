library(intsvy)


### Name: intsvy.per.pv
### Title: Calculates percentiles
### Aliases: intsvy.per.pv

### ** Examples

  ## Not run: 
##D     timss.per.pv(pvlabel="BSMMAT", per = c(5, 10, 25, 50, 75, 90, 95), by="IDCNTRYL", data=timss8)
##D     intsvy.per.pv(pvlabel="BSMMAT",  by="IDCNTRYL", data=timss8, config=timss8_conf)
##D     
##D     pirls.per.pv(pvlabel="ASRREA", by="IDCNTRYL", data=pirls)
##D     intsvy.per.pv(pvlabel="ASRREA", per = c(5, 10, 25, 50, 75, 90, 95), by="IDCNTRYL", data=pirls, 
##D     config=pirls_conf)
##D     
##D     pisa.per.pv(pvlabel="MATH", per=c(10, 25, 75, 90), by="CNT", data=student2012)
##D     intsvy.per.pv(pvlabel="MATH", by="CNT", data=student2012, config=pisa_conf)
##D   
## End(Not run)



