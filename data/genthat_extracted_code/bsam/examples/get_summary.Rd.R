library(bsam)


### Name: get_summary
### Title: Extract summary output and optionally export as a .csv file.
### Aliases: get_summary

### ** Examples

## Not run: 
##D data(ellie)
##D fit <- fit_ssm(ellie, model = "DCRW", tstep = 1, adapt = 2000, samples = 1000, 
##D                 thin = 2, span = 0.1)
##D                 
##D ## print to console                 
##D get_summary(fit)
##D 
##D ## export to .csv file
##D get_summary(fit, file = "ellie_dcrw.csv")
##D 
##D ## plot track of second animal (posterior mean longitude and latitude)
##D p <- ggplot(data = subset(get_summary(fit), id == unique(id)[2])) + 
##D        geom_point(aes(lat, lon), col = "firebrick", size = 2)
##D p
##D 
##D ## overlay posterior median longitude and latitude
##D p + geom_point(aes(lat.5, lon.5), col = "dodgerblue", size = 1)
## End(Not run)



