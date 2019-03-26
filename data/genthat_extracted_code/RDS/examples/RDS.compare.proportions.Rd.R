library(RDS)


### Name: RDS.compare.proportions
### Title: Compares the rates of two variables against one another.
### Aliases: RDS.compare.proportions

### ** Examples

## Not run: 
##D data(faux)
##D int1 <- RDS.bootstrap.intervals(faux, outcome.variable=c("X"), 
##D weight.type="RDS-II", uncertainty="Salganik", N=1000,
##D number.ss.samples.per.iteration=1000, 
##D 	confidence.level=0.95, number.of.bootstrap.samples=100)
##D int2 <- RDS.bootstrap.intervals(faux, outcome.variable=c("Y"), 
##D 	weight.type="RDS-II", uncertainty="Salganik", N=1000,
##D number.ss.samples.per.iteration=1000,
##D confidence.level=0.95, number.of.bootstrap.samples=100)
##D RDS.compare.proportions(int1,int2)
## End(Not run)



