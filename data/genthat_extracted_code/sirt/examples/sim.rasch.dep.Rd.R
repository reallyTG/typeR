library(sirt)


### Name: sim.rasch.dep
### Title: Simulation of the Rasch Model with Locally Dependent Responses
### Aliases: sim.rasch.dep
### Keywords: Simulating IRT models

### ** Examples

#############################################################################
# EXAMPLE 1: 11 Items: 2 itemclusters with 2 resp. 3 dependent items
#             and 6 independent items
#############################################################################

set.seed(7654)
I <- 11                             # number of items
n <- 1500                           # number of persons
b <- seq(-2,2, len=I)               # item difficulties
theta <- stats::rnorm( n, sd=1 )        # person abilities
# itemcluster
itemcluster <- rep(0,I)
itemcluster[ c(3,5)] <- 1
itemcluster[c(2,4,9)] <- 2
# residual correlations
rho <- c( .7, .5 )

# simulate data
dat <- sirt::sim.rasch.dep( theta, b, itemcluster, rho )
colnames(dat) <- paste("I", seq(1,ncol(dat)), sep="")

# estimate Rasch copula model
mod1 <- sirt::rasch.copula2( dat, itemcluster=itemcluster )
summary(mod1)

# compare result with Rasch model estimation in rasch.copula
# delta must be set to zero
mod2 <- sirt::rasch.copula2( dat, itemcluster=itemcluster, delta=c(0,0),
            est.delta=c(0,0)  )
summary(mod2)

# estimate Rasch model with rasch.mml2 function
mod3 <- sirt::rasch.mml2( dat )
summary(mod3)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: 12 Items: Cluster 1 -> Items 1,...,4;
##D #       Cluster 2 -> Items 6,...,9; Cluster 3 -> Items 10,11,12
##D #############################################################################
##D 
##D set.seed(7896)
##D I <- 12                             # number of items
##D n <- 450                            # number of persons
##D b <- seq(-2,2, len=I)               # item difficulties
##D b <- sample(b)                      # sample item difficulties
##D theta <- stats::rnorm( n, sd=1 )        # person abilities
##D # itemcluster
##D itemcluster <- rep(0,I)
##D itemcluster[ 1:4 ] <- 1
##D itemcluster[ 6:9 ] <- 2
##D itemcluster[ 10:12 ] <- 3
##D # residual correlations
##D rho <- c( .55, .25, .45 )
##D 
##D # simulate data
##D dat <- sirt::sim.rasch.dep( theta, b, itemcluster, rho )
##D colnames(dat) <- paste("I", seq(1,ncol(dat)), sep="")
##D 
##D # estimate Rasch copula model
##D mod1 <- sirt::rasch.copula2( dat, itemcluster=itemcluster, numdiff.parm=.001 )
##D summary(mod1)
##D 
##D # Rasch model estimation
##D mod2 <- sirt::rasch.copula2( dat, itemcluster=itemcluster,
##D             delta=rep(0,3), est.delta=rep(0,3) )
##D summary(mod2)
##D 
##D # estimation with pairwise Rasch model
##D mod3 <- sirt::rasch.pairwise( dat )
##D summary(mod3)
## End(Not run)



