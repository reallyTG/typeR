library(cNORM)


### Name: mortality
### Title: Mortality of infants per 1000 life birth from 1960 to 2017
### Aliases: mortality
### Keywords: child datasets datasets, mortality, series time

### ** Examples

## Not run: 
##D # data preparation
##D data.mortality <- rankByGroup(mortality, raw="mortality")
##D data.mortality <- computePowers(data.mortality, age="year")
##D 
##D # modeling
##D model.mortality <- bestModel(data.mortality, raw="mortality")
##D plotSubset(model.mortality, type = 0)
##D plotPercentileSeries(data.mortality, model.mortality, end=9, percentiles = c(.1, .25, .5, .75, .9))
## End(Not run)



