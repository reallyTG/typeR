library(clusterSEs)


### Name: cluster.bs.plm
### Title: Pairs Cluster Bootstrapped p-Values For PLM
### Aliases: cluster.bs.plm

### ** Examples

## Not run: 
##D 
##D # predict employment levels, cluster on group
##D require(plm)
##D data(EmplUK)
##D 
##D emp.1 <- plm(emp ~ wage + log(capital+1), data = EmplUK, 
##D              model = "within", index=c("firm", "year"))
##D cluster.bs.plm(mod=emp.1, dat=EmplUK, cluster="group", ci.level = 0.95, 
##D           boot.reps = 1000, cluster.se = TRUE, report = TRUE, 
##D           prog.bar = TRUE)
##D 
##D # cluster on time
##D 
##D cluster.bs.plm(mod=emp.1, dat=EmplUK, cluster="time", ci.level = 0.95, 
##D             boot.reps = 1000, cluster.se = TRUE, report = TRUE, 
##D             prog.bar = TRUE)
##D 
## End(Not run)



