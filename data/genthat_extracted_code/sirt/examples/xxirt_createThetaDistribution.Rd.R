library(sirt)


### Name: xxirt_createThetaDistribution
### Title: Creates a User Defined Theta Distribution
### Aliases: xxirt_createThetaDistribution

### ** Examples

#############################################################################
## EXAMPLE 1: Definition of theta distribution
#############################################################################

#** theta grid
Theta <- matrix( seq(-10,10,length=31), ncol=1 )

#** theta distribution
P_Theta1 <- function( par, Theta, G){
    mu <- par[1]
    sigma <- max( par[2], .01 )
    TP <- nrow(Theta)
    pi_Theta <- matrix( 0, nrow=TP, ncol=G)
    pi1 <- stats::dnorm( Theta[,1], mean=mu, sd=sigma )
    pi1 <- pi1 / sum(pi1)
    pi_Theta[,1] <- pi1
    return(pi_Theta)
                }
#** create distribution class
par_Theta <- c( "mu"=0, "sigma"=1 )
customTheta  <- sirt::xxirt_createThetaDistribution( par=par_Theta,
                       est=c(FALSE,TRUE), P=P_Theta1 )



