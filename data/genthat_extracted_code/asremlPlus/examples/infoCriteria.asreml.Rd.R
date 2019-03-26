library(asremlPlus)


### Name: infoCriteria.asreml
### Title: Computes AIC and BIC for a model.
### Aliases: infoCriteria.asreml infoCriteria
### Keywords: htest

### ** Examples
## Not run: 
##D    data(Wheat.dat)
##D    current.asr <- asreml(yield ~ Rep + WithinColPairs + Variety, 
##D                          random = ~ Row + Column + units,
##D                          residual = ~ ar1(Row):ar1(Column), 
##D                          data=Wheat.dat)
##D     infoCriteria(current.asr)
## End(Not run)


