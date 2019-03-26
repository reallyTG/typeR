library(LAM)


### Name: loglike_mvnorm
### Title: Log-Likelihood Value of a Multivariate Normal Distribution
### Aliases: loglike_mvnorm loglike_mvnorm_NA_pattern

### ** Examples

#############################################################################
# EXAMPLE 1: Multivariate normal distribution
#############################################################################

library(MASS)

#--- simulate data
Sigma <- c( 1 , .55 , .5 , .55 , 1 , .5 ,.5 , .5 , 1 )
Sigma <- matrix( Sigma , nrow=3 , ncol=3 )
mu <- c(0,1,1.2)
N <- 400
set.seed(9875)
dat <- MASS::mvrnorm( N , mu , Sigma )
colnames(dat) <- paste0("Y",1:3)
S <- stats::cov(dat)
M <- colMeans(dat)

#--- evaulate likelihood
res1 <- LAM::loglike_mvnorm( M=M , S=S , mu=mu , Sigma=Sigma , n = N , lambda = 0 )
# compare log likelihood with somewhat regularized covariance matrix
res2 <- LAM::loglike_mvnorm( M=M , S=S , mu=mu , Sigma=Sigma , n = N , lambda = 1 )
print(res1)
print(res2)

#############################################################################
# EXAMPLE 2: Multivariate normal distribution with missing data patterns
#############################################################################

library(STARTS)

data(data.starts01b, package="STARTS")
dat <- data.starts01b
dat1 <- dat[ , paste0("E",1:3)]

#-- compute sufficient statistics
suff_stat <- LAM::suff_stat_NA_pattern(dat1)
#-- define some population mean and covariance
mu <- colMeans(dat1, na.rm=TRUE)
Sigma <- stats::cov(dat1, use="pairwise.complete.obs")

#-- compute log-likelihood
LAM::loglike_mvnorm_NA_pattern( suff_stat=suff_stat, mu=mu, Sigma=Sigma)



