library(sirt)


### Name: fuzdiscr
### Title: Estimation of a Discrete Distribution for Fuzzy Data (Data in
###   Belief Function Framework)
### Aliases: fuzdiscr
### Keywords: Fuzzy data Belief function

### ** Examples

#############################################################################
# EXAMPLE 1: Binomial distribution Denoeux Example 4.3 (2013)
#############################################################################

#*** define uncertain data
X_alpha <- function( alpha ){
    Q <- matrix( 0, 6, 2 )
    Q[5:6,2] <- Q[1:3,1] <- 1
    Q[4,] <- c( alpha, 1 - alpha )
    return(Q)
        }

# define data for alpha=0.5
X <- X_alpha( alpha=.5 )
  ##   > X
  ##        [,1] [,2]
  ##   [1,]  1.0  0.0
  ##   [2,]  1.0  0.0
  ##   [3,]  1.0  0.0
  ##   [4,]  0.5  0.5
  ##   [5,]  0.0  1.0
  ##   [6,]  0.0  1.0

  ## The fourth observation has equal plausibility for the first and the
  ## second category.

# parameter estimate uncertain data
fuzdiscr( X )
  ##   > sirt::fuzdiscr( X )
  ##   [1] 0.5999871 0.4000129

# parameter estimate pseudo likelihood
colMeans( X )
  ##   > colMeans( X )
  ##   [1] 0.5833333 0.4166667
##-> Observations are weighted according to belief function values.

#*****
# plot parameter estimates as function of alpha
alpha <- seq( 0, 1, len=100 )
res <- sapply( alpha, FUN=function(aa){
             X <- X_alpha( alpha=aa )
             c( sirt::fuzdiscr( X )[1], colMeans( X )[1] )
                    } )
# plot
plot( alpha, res[1,], xlab=expression(alpha), ylab=expression( theta[alpha] ), type="l",
        main="Comparison Belief Function and Pseudo-Likelihood (Example 1)")
lines( alpha, res[2,], lty=2, col=2)
legend( 0, .67, c("Belief Function", "Pseudo-Likelihood" ), col=c(1,2), lty=c(1,2) )

#############################################################################
# EXAMPLE 2: Binomial distribution (extends Example 1)
#############################################################################

X_alpha <- function( alpha ){
    Q <- matrix( 0, 6, 2 )
    Q[6,2] <- Q[1:2,1] <- 1
    Q[3:5,] <- matrix( c( alpha, 1 - alpha ), 3, 2, byrow=TRUE)
    return(Q)
        }

X <- X_alpha( alpha=.5 )
alpha <- seq( 0, 1, len=100 )
res <- sapply( alpha, FUN=function(aa){
           X <- X_alpha( alpha=aa )
           c( sirt::fuzdiscr( X )[1], colMeans( X )[1] )
                    } )
# plot
plot( alpha, res[1,], xlab=expression(alpha), ylab=expression( theta[alpha] ), type="l",
        main="Comparison Belief Function and Pseudo-Likelihood (Example 2)")
lines( alpha, res[2,], lty=2, col=2)
legend( 0, .67, c("Belief Function", "Pseudo-Likelihood" ), col=c(1,2), lty=c(1,2) )

#############################################################################
# EXAMPLE 3: Multinomial distribution with three categories
#############################################################################

# define uncertain data
X <- matrix( c( 1,0,0, 1,0,0,   0,1,0, 0,0,1, .7, .2, .1,
         .4, .6, 0 ), 6, 3, byrow=TRUE )
  ##   > X
  ##        [,1] [,2] [,3]
  ##   [1,]  1.0  0.0  0.0
  ##   [2,]  1.0  0.0  0.0
  ##   [3,]  0.0  1.0  0.0
  ##   [4,]  0.0  0.0  1.0
  ##   [5,]  0.7  0.2  0.1
  ##   [6,]  0.4  0.6  0.0

##->  Only the first four observations are crisp.

#*** estimation for uncertain data
fuzdiscr( X )
  ##   > sirt::fuzdiscr( X )
  ##   [1] 0.5772305 0.2499931 0.1727764

#*** estimation pseudo-likelihood
colMeans(X)
  ##   > colMeans(X)
  ##   [1] 0.5166667 0.3000000 0.1833333

##-> Obviously, the treatment uncertainty is different in belief function
##   and in pseudo-likelihood framework.



