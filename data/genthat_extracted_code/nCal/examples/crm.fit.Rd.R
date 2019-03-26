library(nCal)


### Name: crm.fit
### Title: Fit Concentration Response Model
### Aliases: crm.fit deviance.crm lines.crm coef.crm print.crm

### ** Examples


## Not run: 
##D dat.std=dat.QIL3[dat.QIL3$assay_id=="LMX001",]
##D 
##D # run 3 iter to save time for examples
##D fit.1=crm.fit(fi~expected_conc, dat.std, var.model="power", verbose=TRUE, max.iter=2)
##D fit.2=crm.fit(log(fi)~expected_conc, dat.std, verbose=TRUE)
##D fit.3=crm.fit(log(fi)~expected_conc, dat.std, var.model="power", verbose=TRUE, max.iter=2)
##D 
##D sapply(list(fit.1, fit.2, fit.3), coef)
##D fit.1$var.power
##D fit.2$var.power
##D fit.3$var.power
##D 
##D plot(fit.1, log="xy", type="all", lwd=3, pch="*")
##D lines(fit.2, expy=TRUE, col=2, lwd=3)
##D lines(fit.3, expy=TRUE, col=4, lty=2, lwd=3)
##D     
## End(Not run)





