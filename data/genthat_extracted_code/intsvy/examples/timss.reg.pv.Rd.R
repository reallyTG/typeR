library(intsvy)


### Name: timss.reg.pv
### Title: Regression analysis with plausible values
### Aliases: timss.reg.pv timss2015.reg.pv

### ** Examples

## Not run: 
##D # TIMSS G8: Exhibit 2.11, User Guide TIMSS 2011, p.21
##D timss8g$SEX[timss8g$ITSEX=="BOY"]=1
##D timss8g$SEX[timss8g$ITSEX=="GIRL"]=0
##D timss.reg.pv(pvlabel="BSMMAT", by=c("IDCNTRYL"), x="SEX", data=timss8g)
## End(Not run)



