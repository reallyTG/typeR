library(TAM)


### Name: weighted_Stats
### Title: Descriptive Statistics for Weighted Data
### Aliases: weighted_Stats weighted_var weighted_sd weighted_mean
###   weighted_skewness weighted_curtosis weighted_quantile weighted_table

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example for weighted_var function
#############################################################################

set.seed(9897)
# simulate data
N <- 10
x <- stats::rnorm(N)
w <- stats::runif(N)

#---- variance

# use weighted_var
weighted_var( x=x, w=w )
# use cov.wt
stats::cov.wt( data.frame(x=x), w=w )$cov[1,1]
## Not run: 
##D # use wtd.var from Hmisc package
##D Hmisc::wtd.var(x=x, weights=w, normwt=TRUE, method="unbiased")
##D 
##D #---- standard deviation
##D weighted_sd( x=x, w=w )
##D 
##D #---- mean
##D weighted_mean( x=x, w=w )
##D stats::weighted.mean( x=x, w=w )
##D 
##D #---- weighted quantiles for unweighted data
##D pvec <- c(.23, .53, .78, .99 )  # choose probabilities
##D type <- 7
##D 
##D # quantiles for unweighted data
##D weighted_quantile( x, probs=pvec, type=type)
##D quantile( x, probs=pvec, type=type)
##D Hmisc::wtd.quantile(x,probs=pvec, type=type)
##D 
##D # quantiles for weighted data
##D pvec <- c(.23, .53, .78, .99 )  # probabilities
##D weighted_quantile( x, w=w, probs=pvec)
##D Hmisc::wtd.quantile(x, weights=w, probs=pvec)
##D 
##D #--- weighted skewness and curtosis
##D weighted_skewness(x=x, w=w)
##D weighted_curtosis(x=x, w=w)
##D 
##D #############################################################################
##D # EXAMPLE 2: Descriptive statistics normally distributed data
##D #############################################################################
##D 
##D # simulate some normally distributed data
##D set.seed(7768)
##D x <- stats::rnorm( 10000, mean=1.7, sd=1.2)
##D # some statistics
##D weighted_mean(x=x)
##D weighted_sd(x=x)
##D weighted_skewness(x=x)
##D weighted_curtosis(x=x)
##D 
##D #############################################################################
##D # EXAMPLE 3: Frequency tables
##D #############################################################################
##D 
##D #*****
##D # simulate data for weighted frequency tables
##D y <- scan()
##D    1 0  1 1   1 2   1 3    1 4
##D    2 0  2 1   2 2   2 3    2 4
##D 
##D y <- matrix( y, ncol=2, byrow=TRUE)
##D # define probabilities
##D set.seed(976)
##D pr <- stats::runif(10)
##D pr <- pr / sum(pr)
##D # sample data
##D N <- 300
##D x <- y[ sample( 1:10, size=300, prob=pr, replace=TRUE ), ]
##D w <- stats::runif( N, 0.5, 1.5 )
##D 
##D # frequency table unweighted data
##D weighted_table(x[,2] )
##D table( x[,2] )
##D 
##D # weighted data and proportions
##D weighted_table(x[,2], w=w, props=TRUE)
##D 
##D #*** contingency table
##D table( x[,1], x[,2] )
##D weighted_table( x )
##D # table using weights
##D weighted_table( x, w=w )
## End(Not run)



