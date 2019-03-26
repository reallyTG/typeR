library(clusterSEs)


### Name: cluster.im.ivreg
### Title: Cluster-Adjusted Confidence Intervals And p-Values For GLM
### Aliases: cluster.im.ivreg

### ** Examples

## Not run: 
##D 
##D # example: pooled IV analysis of employment
##D require(plm)
##D require(AER)
##D data(EmplUK)
##D EmplUK$lag.wage <- lag(EmplUK$wage)
##D emp.iv <- ivreg(emp ~ wage + log(capital+1) | output + lag.wage + log(capital+1), data = EmplUK)
##D 
##D # compute cluster-adjusted p-values
##D cluster.im.e <- cluster.im.ivreg(mod=emp.iv, dat=EmplUK, cluster = ~firm)
##D 
## End(Not run)



