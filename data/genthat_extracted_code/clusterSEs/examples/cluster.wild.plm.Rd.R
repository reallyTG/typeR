library(clusterSEs)


### Name: cluster.wild.plm
### Title: Wild Cluster Bootstrapped p-Values For PLM
### Aliases: cluster.wild.plm

### ** Examples

## Not run: 
##D 
##D # predict employment levels, cluster on group
##D require(plm)
##D data(EmplUK)
##D 
##D emp.1 <- plm(emp ~ wage + log(capital+1), data = EmplUK, model = "within",
##D              index=c("firm", "year"))
##D cluster.wild.plm(mod=emp.1, dat=EmplUK, cluster="group", ci.level = 0.95,
##D         boot.reps = 1000, report = TRUE, prog.bar = TRUE)
##D 
##D # cluster on time
##D cluster.wild.plm(mod=emp.1, dat=EmplUK, cluster="time", ci.level = 0.95, 
##D             boot.reps = 1000, report = TRUE, prog.bar = TRUE)
##D 
## End(Not run)



