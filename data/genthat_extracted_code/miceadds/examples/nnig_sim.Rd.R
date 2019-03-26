library(miceadds)


### Name: nnig_sim
### Title: Simulation of Multivariate Linearly Related Non-Normal Variables
### Aliases: nnig_coef nnig_sim

### ** Examples

#############################################################################
# EXAMPLE 1: Simulating data with nnig_sim function
#############################################################################

#* define input parameters
Sigma <- matrix( c(1,.5, .2,
                  .5, 1,.7,
                  .2, .7, 1), 3, 3 )
skew <- c(0,1,1)
kurt <- c(1,3,3)

#* determine coefficients
coeff <- miceadds::nnig_coef( Sigma=Sigma, skew=skew, kurt=kurt )
print(coeff)

#* simulate data
set.seed(2018)
Y <- miceadds::nnig_sim( N=2000, coef=coeff)

## Not run: 
##D #* check descriptive statistics
##D apply(Y, 2, TAM::weighted_skewness )
##D apply(Y, 2, TAM::weighted_kurtosis )
## End(Not run)



