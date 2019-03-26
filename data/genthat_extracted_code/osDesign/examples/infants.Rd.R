library(osDesign)


### Name: infants
### Title: Infant mortality data from North Carolina
### Aliases: infants
### Keywords: datasets

### ** Examples

## Code to generate an aggregated dataset
##
## Not run: 
##D data(infants)
##D ##
##D infants$smoker  <- as.numeric(infants$cignum > 0)
##D infants$teen    <- as.numeric(infants$mage < 20)
##D infants$lowgain <- as.numeric(infants$gained < 20)
##D infants$early   <- as.numeric(infants$weeks < 32)
##D infants$lbw     <- as.numeric(infants$weight < 2500)
##D ##
##D listAgg <- list(year=infants$year, smoker=infants$smoker, teen=infants$teen, 
##D lowgain=infants$lowgain, race=infants$race, male=infants$male, 
##D early=infants$early, lbw=infants$lbw)
##D infantsAgg <- aggregate(rep(1, nrow(infants)), listAgg, FUN=sum)
##D names(infantsAgg)[ncol(infantsAgg)] <- "N"
##D infantsAgg$Y <- aggregate(infants$death, listAgg, FUN=sum)$x
## End(Not run)



