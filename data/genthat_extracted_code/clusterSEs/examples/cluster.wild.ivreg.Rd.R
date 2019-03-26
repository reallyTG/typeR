library(clusterSEs)


### Name: cluster.wild.ivreg
### Title: Wild Cluster Bootstrapped p-Values For For Regression With
###   Instrumental Variables
### Aliases: cluster.wild.ivreg

### ** Examples

## Not run: 
##D 
##D #############################################
##D # example one: predict cigarette consumption
##D #############################################
##D data("CigarettesSW", package = "AER") 
##D CigarettesSW$rprice <- with(CigarettesSW, price/cpi)
##D CigarettesSW$rincome <- with(CigarettesSW, income/population/cpi)
##D CigarettesSW$tdiff <- with(CigarettesSW, (taxs - tax)/cpi)
##D fm <- ivreg(log(packs) ~ log(rprice) + log(rincome) | 
##D     log(rincome) + tdiff + I(tax/cpi), data = CigarettesSW)
##D 
##D # compute cluster-adjusted p-values
##D cluster.wd.c <- cluster.wild.ivreg(fm, dat=CigarettesSW, cluster = ~state, report = T)
##D 
##D 
##D ################################################
##D # example two: pooled IV analysis of employment
##D ################################################
##D require(plm)
##D require(AER)
##D data(EmplUK)
##D EmplUK$lag.wage <- lag(EmplUK$wage)
##D emp.iv <- ivreg(emp ~ wage + log(capital+1) | output + lag.wage + log(capital+1), data = EmplUK)
##D 
##D # compute cluster-adjusted p-values
##D cluster.wd.e <- cluster.wild.ivreg(mod=emp.iv, dat=EmplUK, cluster = ~firm)
##D 
## End(Not run)



