library(survival)


### Name: dsurvreg
### Title: Distributions available in survreg.
### Aliases: dsurvreg psurvreg qsurvreg rsurvreg
### Keywords: distribution

### ** Examples

# List of distributions available
names(survreg.distributions)
## Not run: 
##D  [1] "extreme"     "logistic"    "gaussian"    "weibull"     "exponential"
##D  [6] "rayleigh"    "loggaussian" "lognormal"   "loglogistic" "t"          
## End(Not run)
# Compare results
all.equal(dsurvreg(1:10, 2, 5, dist='lognormal'), dlnorm(1:10, 2, 5))

# Hazard function for a Weibull distribution
x   <- seq(.1, 3, length=30)
haz <- dsurvreg(x, 2, 3)/ (1-psurvreg(x, 2, 3))
## Not run: 
##D plot(x, haz, log='xy', ylab="Hazard") #line with slope (1/scale -1)
## End(Not run)



