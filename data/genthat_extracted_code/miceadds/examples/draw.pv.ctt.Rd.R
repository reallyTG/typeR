library(miceadds)


### Name: draw.pv.ctt
### Title: Plausible Value Imputation Using a Known Measurement Error
###   Variance (Based on Classical Test Theory)
### Aliases: draw.pv.ctt
### Keywords: Plausible value imputation Latent variables

### ** Examples

#############################################################################
# SIMULATED EXAMPLE 1: Scale scores
#############################################################################

set.seed(899)
n <- 5000       # number of students
x <- round( stats::runif( n, 0,1 ) )
y <- stats::rnorm(n)
# simulate true score theta
theta <- .6 + .4*x + .5 * y + stats::rnorm(n)
# simulate observed score by adding measurement error
sig.e <- rep( sqrt(.40), n )
theta_obs <- theta + stats::rnorm( n, sd=sig.e)

# calculate alpha
( alpha <- stats::var( theta ) / stats::var( theta_obs ) )
# [1] 0.7424108
#=> Ordinarily, sig.e or alpha will be known, assumed or estimated by using items,
#    replications or an appropriate measurement model.

# create matrix of predictors
X <- as.matrix( cbind(x, y ) )

# plausible value imputation with scale score
imp1 <- miceadds::draw.pv.ctt( y=theta_obs, x=X, sig.e=sig.e )
# check results
stats::lm( imp1 ~ x + y )

# imputation with alpha as an input
imp2 <- miceadds::draw.pv.ctt( y=theta_obs, x=X, alpha=.74 )
stats::lm( imp2 ~ x + y )

## Not run: 
##D #--- plausible value imputation in Amelia package
##D library(Amelia)
##D 
##D # define data frame
##D dat <- data.frame( "x"=x, "y"=y, "theta"=theta_obs )
##D # generate observation-level priors for theta
##D priors <- cbind( 1:n, 3, theta_obs, sig.e )
##D              # 3 indicates column index for theta
##D overimp <- priors[,1:2]
##D # run Amelia
##D imp <- Amelia::amelia( dat, priors=priors, overimp=overimp, m=10)
##D # create object of class datlist and evaluate results
##D datlist <- miceadds::datlist_create( imp$imputations )
##D withPool_MI( with( datlist, stats::var(theta) ) )
##D stats::var(theta)       # compare with true variance
##D mod <- with( datlist,  stats::lm( theta ~ x + y ) )
##D mitools::MIcombine(mod)
## End(Not run)



