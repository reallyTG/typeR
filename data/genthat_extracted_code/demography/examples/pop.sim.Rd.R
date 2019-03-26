library(demography)


### Name: pop.sim
### Title: Population simulation
### Aliases: pop.sim
### Keywords: models

### ** Examples

## Not run: 
##D require(addb)
##D # Construct data objects
##D mort.sm <- smooth.demogdata(set.upperage(extract.years(australia,1950:2002),100))
##D fert.sm <- smooth.demogdata(extract.years(aus.fertility,1950:2002))
##D aus.mig <- netmigration(set.upperage(australia,100),aus.fertility,mfratio=1.0545)
##D # Fit models
##D mort.fit <- coherentfdm(mort.sm)
##D fert.fit <- fdm(fert.sm)
##D mig.fit <- coherentfdm(aus.mig)
##D # Produce forecasts
##D mort.fcast <- forecast(mort.fit)
##D fert.fcast <- forecast(fert.fit)
##D mig.fcast <- forecast(mig.fit)
##D # Simulate
##D aus.sim <- pop.sim(mort.fcast,fert.fcast,mig.fcast,australia)
## End(Not run)



