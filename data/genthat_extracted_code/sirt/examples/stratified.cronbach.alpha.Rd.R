library(sirt)


### Name: stratified.cronbach.alpha
### Title: Stratified Cronbach's Alpha
### Aliases: stratified.cronbach.alpha
### Keywords: Reliability

### ** Examples

#############################################################################
# EXAMPLE 1: data.read
#############################################################################

data( data.read )
dat <- data.read
I <- ncol(dat)

# apply function without defining item strata
stratified.cronbach.alpha( data.read  )

# define item strata
itemstrata <- cbind( colnames(dat), substring( colnames(dat), 1,1 ) )
stratified.cronbach.alpha( data.read, itemstrata=itemstrata )
  ##   scale  I alpha mean.tot var.tot alpha.stratified
  ## 1 total 12 0.677    8.680   5.668            0.703
  ## 2     A  4 0.545    2.616   1.381               NA
  ## 3     B  4 0.381    2.811   1.059               NA
  ## 4     C  4 0.640    3.253   1.107               NA

## Not run: 
##D #**************************
##D # reliability analysis in psych package
##D library(psych)
##D # Cronbach's alpha and item discriminations
##D psych::alpha( dat )
##D # McDonald's omega
##D psych::omega(dat, nfactors=1)     # 1 factor
##D   ##   Alpha:                 0.69
##D   ##   Omega Total            0.69
##D ##=> Note that alpha in this function is the standardized Cronbach's
##D ##     alpha, i.e. alpha computed for standardized variables.
##D psych::omega(dat, nfactors=2)     # 2 factors
##D   ##   Omega Total            0.72
##D psych::omega(dat, nfactors=3)     # 3 factors
##D   ##   Omega Total            0.74
## End(Not run)



