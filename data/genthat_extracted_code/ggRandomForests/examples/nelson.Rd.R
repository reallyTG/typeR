library(ggRandomForests)


### Name: nelson
### Title: nonparametric Nelson-Aalen estimates
### Aliases: nelson

### ** Examples

## Not run: 
##D # These get run through the gg_survival examples.
##D data(pbc, package="randomForestSRC")
##D pbc$time <- pbc$days/364.25
##D 
##D # This is the same as gg_survival
##D gg_dta <- nelson(interval="time", censor="status", 
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
##D plot(gg_dta, error="lines")
##D plot(gg_dta)
##D 
##D gg_dta <- gg_survival(interval="time", censor="status", 
##D                      data=pbc, by="treatment",
##D                      type="nelson")
##D                      
##D plot(gg_dta, error="bars")
##D plot(gg_dta)
##D 
## End(Not run)                                            



