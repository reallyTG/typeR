library(phenopix)


### Name: get.options
### Title: Returns default options for function 'autoFilter'.
### Aliases: get.options

### ** Examples

## Not run: 
##D data(bartlett2009)
##D ## with raw.dn ==TRUE and column position for chromatic coordinates
##D filtered.data <- autoFilter(bartlett2009, dn=c(5:7), 
##D 	filter=c('night', 'spline', 'max'),
##D     filter.options=NULL, raw.dn=TRUE)
##D my.options <- get.options()
##D ## change time window for max filter
##D my.options$max.filter$w <- 5
##D filtered.data2 <- autoFilter(bartlett2009, dn=c(5:7), 
##D 	filter=c('night', 'spline', 'max'),
##D     filter.options=my.options, raw.dn=TRUE)
##D plot(filtered.data$max.filtered)
##D lines(filtered.data2$max.filtered, col='red')
## End(Not run)



