library(miceadds)


### Name: stats0
### Title: Descriptive Statistics for a Vector or a Data Frame
### Aliases: stats0 max0 min0 mean0 sd0 var0 quantile0 prop_miss
### Keywords: R utilities

### ** Examples

#############################################################################
# EXAMPLE 1: Descriptive statistics toy datasets
#############################################################################

#--- simulate vector y and data frame dat
set.seed(765)
N <- 25    # number of observations
y <- stats::rnorm(N)
V <- 4    # number of variables
dat <- matrix( stats::rnorm( N*V ), ncol=V )
colnames(dat) <- paste0("V",1:V)

#-- standard deviation
apply( dat, 2, stats::sd )
sd0( dat )
#-- mean
apply( dat, 2, base::mean )
mean0( dat )
#-- quantile
apply( dat, 2, stats::quantile )
quantile0( dat )
#-- minimum and maximum
min0(dat)
max0(dat)

#*** apply functions to missing data
dat1 <- dat
dat1[ cbind( c(2,5),2) ] <- NA

#-- proportion of missing data
prop_miss( dat1 )
#-- MAD statistic
stats0( dat, FUN=stats::mad )
#-- SD
sd0(y)



