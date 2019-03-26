library(stratifyR)


### Name: strata.distr
### Title: Stratification of Univariate Survey Population Using the
###   Distribution
### Aliases: strata.distr

### ** Examples

## Not run: 
##D #Assume data has initial value of 1.5, distance of 33 and follows
##D #weibull distribution with estimated parameters as shape=2.15 and scale=13.5
##D #To compute the OSB, OSS, etc. with fixed sample n=500:
##D strata.distr(h=2, initval=1.5, dist=33, distr = "weibull",
##D params = c(shape=2.15, scale=13.5), n=500, N=2000)
##D 
##D #-------------------------------------------------------------
##D #Assume data has initial value of 1, distance of 10415 and follows
##D #lnorm distribution with estimated parameters as meanlog=5.5 and sdlog=1.5
##D #To compute the OSB, OSS, etc. with fixed sample n=500:
##D strata.distr(h=2, initval=1, dist=10415, distr = "lnorm",
##D params = c(meanlog=5.5, sdlog=1.5), n=500, N=12000)
##D 
##D #-------------------------------------------------------------
##D #Assume data has initial value of 2, distance of 68 and follows
##D #gamma distribution with estimated parameters as shape=3.8 and rate=0.55
##D #To compute the OSB, OSS, etc. with fixed sample n=500:
##D strata.distr(h=2, initval=0.65, dist=68, distr = "gamma",
##D params = c(shape=3.8, rate=0.55), n=500, N=10000)
##D #-------------------------------------------------------------
## End(Not run)




