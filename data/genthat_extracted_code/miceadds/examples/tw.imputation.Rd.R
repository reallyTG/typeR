library(miceadds)


### Name: tw.imputation
### Title: Two-Way Imputation
### Aliases: tw.imputation tw.mcmc.imputation
### Keywords: Two-way imputation

### ** Examples

#############################################################################
# EXAMPLE 1: Two-way imputation data.internet
#############################################################################

data(data.internet)
data <- data.internet

#***
# Model 1: Two-way imputation method of Sijtsma and van der Ark (2003)
set.seed(765)
dat.imp <- miceadds::tw.imputation( data )
dat.imp[ 278:281,]
  ##       IN9     IN10    IN11     IN12
  ##   278   5 4.829006 5.00000 4.941611
  ##   279   5 4.000000 4.78979 4.000000
  ##   280   7 4.000000 7.00000 7.000000
  ##   281   4 3.000000 5.00000 5.000000

## Not run: 
##D #***
##D # Model 2: Two-way imputation method using MCMC
##D dat.imp <- miceadds::tw.mcmc.imputation( data, iter=3)
##D dat.imp[ 278:281,]
##D   ##       IN9     IN10     IN11     IN12
##D   ##   278   5 6.089222 5.000000 3.017244
##D   ##   279   5 4.000000 5.063547 4.000000
##D   ##   280   7 4.000000 7.000000 7.000000
##D   ##   281   4 3.000000 5.000000 5.000000
## End(Not run)



