library(intsvy)


### Name: intsvy.mean.pv
### Title: Calculates mean achievement score
### Aliases: intsvy.mean.pv

### ** Examples

## Not run: 
##D intsvy.mean.pv(pvnames = paste0("ASRREA0",1:5), by= "IDCNTRYL", 
##D     data=pirls, config=pirls_conf)
##D 
##D intsvy.mean.pv(pvnames = paste0("PV",1:5,"MATH"), by="CNT", data=student2012, 
##D     config=pisa_conf)
##D     
##D intsvy.mean.pv(pvnames = paste0("BSMMAT0",1:5), by= "IDCNTRYL", data=timss8g, 
##D     config=timss8_conf)
##D     
##D intsvy.mean.pv(pvnames = paste0("PVNUM", 1:10), by="CNTRYID", data=piaac, 
##D     config=piaac_conf)    
## End(Not run)



