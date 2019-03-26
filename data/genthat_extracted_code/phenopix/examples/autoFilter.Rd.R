library(phenopix)


### Name: autoFilter
### Title: A multiple-approach filtering procedure
### Aliases: autoFilter

### ** Examples

## Not run: 
##D data(bartlett2009)
##D ## with raw.dn ==TRUE and column position for chromatic coordinates
##D par(mfrow=c(3,1), oma=c(5,4,4,2), mar=rep(0,4))
##D filtered.data <- autoFilter(bartlett2009, dn=c(5:7), 
##D   filter=c('night', 'spline', 'max'),
##D   filter.options=NULL, raw.dn=TRUE)
##D ## same as before but returning unfilled data 
##D filtered.data <- autoFilter(bartlett2009, dn=c(5:7), 
##D   filter=c('night', 'spline', 'max'),
##D   filter.options=NULL, na.fill=FALSE, raw.dn=TRUE)
##D ## all filters in action (check the plot)
##D filtered.data <- autoFilter(bartlett2009, dn=c(5:7), 
##D   filter=c('night','blue', 'mad','spline', 'max'),
##D   filter.options=NULL, raw.dn=TRUE)
##D ## check filter names
##D names(filtered.data)
## End(Not run)



