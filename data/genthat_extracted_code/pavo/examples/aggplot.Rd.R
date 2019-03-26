library(pavo)


### Name: aggplot
### Title: Plot aggregated reflectance spectra
### Aliases: aggplot

### ** Examples

## Not run: 
##D 
##D # Load reflectance data
##D data(sicalis)
##D 
##D # Create grouping variable based on spec names
##D bysic <- gsub("^ind[0-9].",'', names(sicalis)[-1])
##D 
##D # Plot using various error functions and options
##D aggplot(sicalis, bysic)
##D aggplot(sicalis, bysic, FUN.error=function(x) quantile(x, c(0.0275,0.975)))
##D aggplot(sicalis, bysic, shade = spec2rgb(sicalis), lcol = 1)
##D aggplot(sicalis, bysic, lcol = 1, FUN.error = function(x) sd(x)/sqrt(length(x)))
## End(Not run)




