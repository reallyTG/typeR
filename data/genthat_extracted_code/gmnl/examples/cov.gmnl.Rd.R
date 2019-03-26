library(gmnl)


### Name: cov.gmnl
### Title: Functions for Correlated Random Parameters
### Aliases: cor.gmnl cov.gmnl se.cov.gmnl

### ** Examples

## Not run: 
##D ## Examples using Electricity data set from mlogit package
##D library(mlogit)
##D data("Electricity", package = "mlogit")
##D Electr <- mlogit.data(Electricity, id.var = "id", choice = "choice",
##D                      varying = 3:26, shape = "wide", sep = "")
##D                      
##D ## Estimate a MIXL model with correlated random parameters
##D Elec.cor <- gmnl(choice ~ pf + cl + loc + wk + tod + seas| 0, data = Electr,
##D                  subset = 1:3000,
##D                  model = 'mixl',
##D                  R = 10,
##D                  panel = TRUE,
##D                  ranp = c(cl = "n", loc = "n", wk = "n", tod = "n", seas = "n"),
##D                  correlation = TRUE)
##D                  
##D ## Use functions for correlated random parameters
##D cov.gmnl(Elec.cor)
##D se.cov.gmnl(Elec.cor)
##D se.cov.gmnl(Elec.cor, sd = TRUE)
##D cor.gmnl(Elec.cor)
## End(Not run)



