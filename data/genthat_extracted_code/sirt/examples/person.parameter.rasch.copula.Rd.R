library(sirt)


### Name: person.parameter.rasch.copula
### Title: Person Parameter Estimation of the Rasch Copula Model (Braeken,
###   2011)
### Aliases: person.parameter.rasch.copula
### Keywords: IRT copula models Person parameter estimation

### ** Examples

#############################################################################
# EXAMPLE 1: Reading Data
#############################################################################

data(data.read)
dat <- data.read

# define item cluster
itemcluster <- rep( 1:3, each=4 )
mod1 <- sirt::rasch.copula2( dat, itemcluster=itemcluster )
summary(mod1)

# person parameter estimation under the Rasch copula model
pmod1 <- sirt::person.parameter.rasch.copula(raschcopula.object=mod1 )
## Mean percentage standard error inflation
##   missing.pattern Mperc.seinflat
## 1               1           6.35

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: 12 items nested within 3 item clusters (testlets)
##D #   Cluster 1 -> Items 1-4; Cluster 2 -> Items 6-9;  Cluster 3 -> Items 10-12
##D #############################################################################
##D 
##D set.seed(967)
##D I <- 12                             # number of items
##D n <- 450                            # number of persons
##D b <- seq(-2,2, len=I)               # item difficulties
##D b <- sample(b)                      # sample item difficulties
##D theta <- stats::rnorm( n, sd=1 ) # person abilities
##D # itemcluster
##D itemcluster <- rep(0,I)
##D itemcluster[ 1:4 ] <- 1
##D itemcluster[ 6:9 ] <- 2
##D itemcluster[ 10:12 ] <- 3
##D # residual correlations
##D rho <- c( .35, .25, .30 )
##D 
##D # simulate data
##D dat <- sirt::sim.rasch.dep( theta, b, itemcluster, rho )
##D colnames(dat) <- paste("I", seq(1,ncol(dat)), sep="")
##D 
##D # estimate Rasch copula model
##D mod1 <- sirt::rasch.copula2( dat, itemcluster=itemcluster )
##D summary(mod1)
##D 
##D # person parameter estimation under the Rasch copula model
##D pmod1 <- sirt::person.parameter.rasch.copula(raschcopula.object=mod1 )
##D   ## Mean percentage standard error inflation
##D   ##   missing.pattern Mperc.seinflat
##D   ## 1               1          10.48
## End(Not run)



