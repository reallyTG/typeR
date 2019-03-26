library(ggRandomForests)


### Name: plot.gg_survival
### Title: Plot a 'gg_survival' object.
### Aliases: plot.gg_survival

### ** Examples

## Not run: 
##D ## -------- pbc data
##D data(pbc, package="randomForestSRC")
##D pbc$time <- pbc$days/364.25
##D 
##D # This is the same as kaplan
##D gg_dta <- gg_survival(interval="time", censor="status", 
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
##D 
##D # ...with smaller confidence limits.
##D gg_dta <- gg_survival(interval="time", censor="status", 
##D                      data=pbc, by="treatment", conf.int=.68)
##D                      
##D plot(gg_dta, error="lines")
##D 
## End(Not run)




