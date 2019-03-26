library(SUMMER)


### Name: plot.projINLA
### Title: Plot projection output.
### Aliases: plot.projINLA

### ** Examples

## Not run: 
##D data(DemoData)
##D deta(DemoMap)
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
##D 
##D # Model fitting with INLA
##D years.all <- c(years, "15-19")
##D fit <- fitINLA(data = data, geo = geo, Amat = mat, 
##D year_names = years.all, year_range = c(1985, 2019), 
##D priors = priors, rw = 2, is.yearly=TRUE, 
##D m = 5, type.st = 4)
##D # Projection
##D out <- projINLA(fit, Amat = mat, is.yearly = TRUE)
##D plot(out, is.yearly=TRUE, is.subnational=TRUE) + ggplot2::ggtitle("Subnational yearly model")
##D 
## End(Not run)



