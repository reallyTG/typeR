library(frailtypack)


### Name: subcluster
### Title: Identify subclusters
### Aliases: subcluster
### Keywords: misc

### ** Examples



## Not run: 
##D 
##D data(dataNested)
##D modClu <- frailtyPenal(Surv(t1,t2,event)~cluster(group)+
##D subcluster(subgroup)+cov1+cov2,data=dataNested,
##D n.knots=8,kappa=c(50000,50000),hazard="Splines")
##D 
##D print(modClu)
##D 
##D #-- here is generated cluster (30 clusters)
##D readmissionNested <- transform(readmission,group=id%%30+1)
##D 
##D modJointNested_Splines <- frailtyPenal(formula = Surv(t.start, t.stop, event)
##D 	~ subcluster(id) + cluster(group) + dukes + 
##D 	terminal(death), formula.terminalEvent = ~dukes, 
##D 	data = readmissionNested, recurrentAG = TRUE, n.knots = 8, 
##D 	kappa = c(9.55e+9, 1.41e+12), initialize = TRUE)
##D 
## End(Not run)





