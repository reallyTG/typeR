library(oce)


### Name: plot,amsr-method
### Title: Plot an amsr Object
### Aliases: plot,amsr-method plot.amsr

### ** Examples

## Not run: 
##D d <- read.amsr("f34_20160102v7.2.gz")
##D asp <- 1/cos(pi*40/180)
##D plot(d, "SST", col=oceColorsJet, xlim=c(-80,0), ylim=c(20,60), asp=asp)
##D data(coastlineWorldMedium, package="ocedata")
##D lines(coastlineWorldMedium[['longitude']], coastlineWorldMedium[['latitude']])
## End(Not run)




