library(intsvy)


### Name: pirls.reg.pv
### Title: Regression analysis with plausible values
### Aliases: pirls.reg.pv pirls2016.reg.pv

### ** Examples

## Not run: 
##D 
##D # PIRLS: Exhibit 2.11, User Guide PIRLS 2011, p.21
##D pirls$SEX[pirls$ITSEX=="BOY"]=1
##D pirls$SEX[pirls$ITSEX=="GIRL"]=0
##D pirls.reg.pv(pvlabel="ASRREA", by="IDCNTRYL", x="SEX", data=pirls)
## End(Not run)



