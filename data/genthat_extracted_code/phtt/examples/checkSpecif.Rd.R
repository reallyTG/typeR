library(phtt)


### Name: checkSpecif
### Title: Tests to check the model specifications
### Aliases: checkSpecif checkSpecification

### ** Examples

## See the example in 'help(Cigar)' in order to take a look at the
## data set 'Cigar'

##########
## DATA ##
##########

data(Cigar)
## Panel-Dimensions:
N <- 46
T <- 30
## Dependent variable:
  ## Cigarette-Sales per Capita
  l.Consumption      <- log(matrix(Cigar$sales, T,N))
  d.l.Consumption    <- diff(l.Consumption)
## Independent variables:
  ## Consumer Price Index
  cpi           <- matrix(Cigar$cpi, T,N)
  ## Real Price per Pack of Cigarettes 
  l.Price       <- log(matrix(Cigar$price, T,N)/cpi)
  d.l.Price     <- diff(l.Price)
  ## Real Disposable Income per Capita  
  l.Income      <- log(matrix(Cigar$ndi,   T,N)/cpi)
  d.l.Income    <- diff(l.Income)

#####################################################################
## Testing the Sufficiency of a classical 'twoways' effects model: ##
## Hausman-type Test of Bai (2009)                                 ##
#####################################################################

## Model under the null Hypothesis:
twoways.obj <- Eup(d.l.Consumption ~ -1 + d.l.Price + d.l.Income,
	factor.dim = 0, additive.effects = "twoways")

## Model under the alternative Hypothesis:
not.twoways.obj <- Eup(d.l.Consumption ~ -1 + d.l.Price + d.l.Income,
	factor.dim = 2, additive.effects = "none")

###########
## Test: ##
###########

## (This test returns an error message, since the (unobserved) true
## factor dimension is probably greater than 2.)
## Not run: 
##D checkSpecif(obj1 = twoways.obj, obj2 = not.twoways.obj, level = 0.01)
## End(Not run)

#####################################################################
## Testing the Existence of additional (unobserved) common Factors ##
## Specification Test of Kneip, Sickles, and Song (2012)           ##
#####################################################################

## For the model of Bai (2009):
Eup.obj <- Eup(d.l.Consumption ~ -1 + d.l.Price + d.l.Income,
	   additive.effects = "twoways")

## Test:
checkSpecif(Eup.obj, level = 0.01)

## For the model of Kneip, Sickles, and Song (2012):
KSS.obj <- KSS(l.Consumption ~ -1 + l.Price + l.Income,
	   additive.effects = "twoways")

## Test:
checkSpecif(KSS.obj, level = 0.01)


