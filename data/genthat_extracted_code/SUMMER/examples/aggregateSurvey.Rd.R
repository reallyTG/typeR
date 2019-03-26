library(SUMMER)


### Name: aggregateSurvey
### Title: Aggregate estimators from different surveys.
### Aliases: aggregateSurvey

### ** Examples

## Not run: 
##D data(DemoData)
##D data(DemoMap)
##D years <- levels(DemoData[[1]]$time)
##D 
##D # obtain direct estimates
##D data <- countrySummary_mult(births = DemoData, 
##D years = years, idVar = "id", 
##D regionVar = "region", timeVar = "time", 
##D clusterVar = "~clustid+id", 
##D ageVar = "age", weightsVar = "weights", 
##D geo.recode = NULL)
##D 
##D # obtain maps
##D geo <- DemoMap$geo
##D mat <- DemoMap$Amat
##D 
##D # Simulate hyper priors
##D priors <- simhyper(R = 2, nsamp = 1e+05, nsamp.check = 5000, Amat = mat, only.iid = TRUE)
##D 
##D # combine data from multiple surveys
##D data <- aggregateSurvey(data)
##D utils::head(data)
##D 
## End(Not run)




