library(gmnl)


### Name: plot.gmnl
### Title: Plot of the Distribution of the Conditional Expectation of
###   Random Parameters
### Aliases: plot.gmnl

### ** Examples

## Not run: 
##D ## Examples using the Electricity data set from the mlogit package
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
##D ## Plot the density of the conditional expectation distribution of loc
##D plot(Elec.cor, par = "loc", effect = "ce", type = "density", col = "grey")
##D 
##D ## Plot the conditional expectation of loc for each individual
##D plot(Elec.cor, par = "loc", effect = "ce", ind = TRUE, id = 1:30)
##D 
##D ## Plot the WTP for cl
##D plot(Elec.cor, par = "loc", effect = "wtp", wrt = "pf")                  
## End(Not run) 



