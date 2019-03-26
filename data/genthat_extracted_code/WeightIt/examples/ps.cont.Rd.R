library(WeightIt)


### Name: ps.cont
### Title: Generalized Propensity Score Estimation using GBM
### Aliases: ps.cont gbm.cont summary.ps.cont plot.ps.cont boxplot.ps.cont

### ** Examples

## Not run: 
##D library("cobalt")
##D data("lalonde", package = "cobalt")
##D 
##D #Balancing covariates with respect to re75
##D psc.out <- ps.cont(re75 ~ age + educ + married +
##D                 nodegree + race + re74, data = lalonde,
##D                 stop.method = c("p.mean", "p.max"),
##D                 use.optimize = 2)
##D summary(psc.out)
##D twang::bal.table(psc.out) #twang's bal.table
## End(Not run)


