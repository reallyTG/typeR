library(ocedata)


### Name: wilson
### Title: Wilson's (1963) table of seafloor spreading
### Aliases: wilson
### Keywords: datasets

### ** Examples

## Not run: 
##D data(wilson, package="ocedata")
##D plot(wilson$Age, wilson$Distance, xlab="Age [My]", ylab="Distance [km]",
##D      xlim=c(125,0), ylim=c(0,4000))
##D abline(0,4000/125)
##D m <- lm(Distance~Age-1, data=wilson)
##D ## Wilson reports in cm/year; 1cm/y = 1km/1My * 1e5 / 1e6
##D spreadingRate <- as.numeric(coef(m)) / 10 
##D print(spreadingRate)
##D abline(m, col='red')
## End(Not run)



