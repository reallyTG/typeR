library(ggRandomForests)


### Name: kaplan
### Title: nonparametric kaplan-meier estimates
### Aliases: kaplan

### ** Examples

## Not run: 
##D # These get run through the gg_survival examples.
##D data(pbc, package="randomForestSRC")
##D pbc$time <- pbc$days/364.25
##D 
##D # This is the same as gg_survival
##D gg_dta <- kaplan(interval="time", censor="status", 
##D                      data=pbc)
##D                      
##D plot(gg_dta, error="none")
##D plot(gg_dta)
##D 
##D # Stratified on treatment variable.
##D gg_dta <- gg_survival(interval="time", censor="status", 
##D                      data=pbc, by="treatment")
##D                      
##D plot(gg_dta, error="none")
##D plot(gg_dta)
## End(Not run)                                            



