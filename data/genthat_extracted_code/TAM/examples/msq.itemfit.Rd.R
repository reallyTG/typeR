library(TAM)


### Name: msq.itemfit
### Title: Mean Squared Residual Based Item Fit Statistics (Infit, Outfit)
### Aliases: msq.itemfit summary.msq.itemfit msq.itemfitWLE
###   summary.msq.itemfitWLE
### Keywords: Item fit

### ** Examples

#############################################################################
# EXAMPLE 1: Simulated data Rasch model
#############################################################################

#*** simulate data
library(sirt)
set.seed(9875)
N <- 2000
I <- 20
b <- sample( seq( -2, 2, length=I ) )
a <- rep( 1, I )
# create some misfitting items
a[c(1,3)] <- c(.5, 1.5 )
# simulate data
dat <- sirt::sim.raschtype( rnorm(N), b=b, fixed.a=a )
#*** estimate Rasch model
mod1 <- TAM::tam.mml(resp=dat)
# compute WLEs
wmod1 <- TAM::tam.wle(mod1)$theta

#--- item fit from "msq.itemfit" function
fit1 <- TAM::msq.itemfit(mod1)
summary( fit1 )

## Not run: 
##D #--- item fit using simulation in "tam.fit"
##D fit0 <- TAM::tam.fit( mod1 )
##D summary(fit0)
##D 
##D #--- item fit based on WLEs
##D fit2a <- TAM::msq.itemfitWLE( mod1 )
##D summary(fit2a)
##D 
##D #++ fit assessment in mirt package
##D library(mirt)
##D mod1b <- mirt::mirt( dat, model=1, itemtype="Rasch", verbose=TRUE )
##D print(mod1b)
##D sirt::mirt.wrapper.coef(mod1b)
##D fmod1b <- mirt::itemfit(mod1b, Theta=as.matrix(wmod1,ncol=1),
##D                  Zh=TRUE, X2=FALSE, S_X2=FALSE )
##D cbind( fit2a$fit_data, fmod1b )
##D 
##D #++ fit assessment in eRm package
##D library(eRm)
##D mod1c <- eRm::RM( dat )
##D summary(mod1c)
##D eRm::plotPImap(mod1c)    # person-item map
##D pmod1c <- eRm::person.parameter(mod1c)
##D fmod1c <- eRm::itemfit(pmod1c)
##D print(fmod1c)
##D plot(fmod1c)
##D 
##D #--- define some item groups for fit assessment
##D 
##D # bases on evaluating the posterior
##D fitindices <- rep( paste0("IG",c(1,2)), each=10)
##D fit2 <- TAM::msq.itemfit( mod1, fitindices )
##D summary(fit2)
##D 
##D # using WLEs
##D fit2b <- TAM::msq.itemfitWLE( mod1, fitindices )
##D summary(fit2b)
## End(Not run)

#############################################################################
# EXAMPLE 2: data.read | fit statistics assessed for testlets
#############################################################################

library(sirt)
data(data.read,package="sirt")
dat <- data.read

# fit Rasch model
mod <- TAM::tam.mml( dat )

#***** item fit for each item
# based on posterior
res1 <- TAM::msq.itemfit( mod  )
summary(res1)
# based on WLEs
res2 <- TAM::msq.itemfitWLE( mod  )
summary(res2)

#***** item fit for item groups
# define item groups
fitindices <- substring( colnames(dat), 1, 1 )
# based on posterior
res1 <- TAM::msq.itemfit( mod, fitindices )
summary(res1)
# based on WLEs
res2 <- TAM::msq.itemfitWLE( mod, fitindices )
summary(res2)

## Not run: 
##D #############################################################################
##D # EXAMPLE 3: Fit statistics for rater models
##D #############################################################################
##D 
##D library(sirt)
##D data(data.ratings2, package="sirt")
##D dat <- data.ratings2
##D 
##D # fit rater model "~ item*step + rater"
##D mod <- TAM::tam.mml.mfr( resp=dat[, paste0( "k",1:5) ],
##D             facets=dat[, "rater", drop=FALSE],
##D             pid=dat$pid, formulaA=~ item*step + rater )
##D 
##D # fit for parameter with "tam.fit" function
##D fmod1a <- TAM::tam.fit( mod )
##D fmod1b <- TAM::msq.itemfit( mod )
##D summary(fmod1a)
##D summary(fmod1b)
##D 
##D # define item groups using pseudo items from object "mod"
##D pseudo_items <- colnames(mod$resp)
##D pss <- strsplit( pseudo_items, split="-" )
##D item_parm <- unlist( lapply( pss, FUN=function(ll){ ll[1] } ) )
##D rater_parm <- unlist( lapply( pss, FUN=function(ll){ ll[2] } ) )
##D 
##D # fit for items with "msq.itemfit" functions
##D res2a <- TAM::msq.itemfit( mod, item_parm )
##D res2b <- TAM::msq.itemfitWLE( mod, item_parm )
##D summary(res2a)
##D summary(res2b)
##D 
##D # fit for raters
##D res3a <- TAM::msq.itemfit( mod, rater_parm )
##D res3b <- TAM::msq.itemfitWLE( mod, rater_parm )
##D summary(res3a)
##D summary(res3b)
## End(Not run)



