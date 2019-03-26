library(RDS)


### Name: RDS.bootstrap.intervals
### Title: RDS Bootstrap Interval Estimates
### Aliases: RDS.bootstrap.intervals
### Keywords: manip survey

### ** Examples


## Not run: 
##D data(fauxmadrona)
##D RDS.bootstrap.intervals(rds.data=fauxmadrona,weight.type="RDS-II",
##D      uncertainty="Salganik",
##D 	outcome.variable="disease",N=1000,number.of.bootstrap.samples=50)
##D 
##D data(fauxtime)
##D RDS.bootstrap.intervals(rds.data=fauxtime,weight.type="HCG",
##D      uncertainty="HCG",
##D 	outcome.variable="var1",N=1000,number.of.bootstrap.samples=10)
## End(Not run)




