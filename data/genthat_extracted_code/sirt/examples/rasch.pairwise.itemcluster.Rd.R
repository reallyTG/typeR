library(sirt)


### Name: rasch.pairwise.itemcluster
### Title: Pairwise Estimation of the Rasch Model for Locally Dependent
###   Items
### Aliases: rasch.pairwise.itemcluster
### Keywords: Pairwise conditional maximum likelihood (PCML) Local
###   dependence

### ** Examples

#############################################################################
# EXAMPLE 1: Example with locally dependent items
#      12 Items: Cluster 1 -> Items 1,...,4
#                Cluster 2 -> Items 6,...,9
#                Cluster 3 -> Items 10,11,12
#############################################################################

set.seed(7896)
I <- 12                             # number of items
n <- 5000                           # number of persons
b <- seq(-2,2, len=I)               # item difficulties
bsamp <- b <- sample(b)             # sample item difficulties
theta <- stats::rnorm( n, sd=1 ) # person abilities
# itemcluster
itemcluster <- rep(0,I)
itemcluster[ 1:4 ] <- 1
itemcluster[ 6:9 ] <- 2
itemcluster[ 10:12 ] <- 3
# residual correlations
rho <- c( .55, .25, .45 )

# simulate data
dat <- sirt::sim.rasch.dep( theta, b, itemcluster, rho )
colnames(dat) <- paste("I", seq(1,ncol(dat)), sep="")

# estimation with pairwise Rasch model
mod3 <- sirt::rasch.pairwise( dat )
summary(mod3)

# use item cluster in rasch pairwise estimation
mod <- sirt::rasch.pairwise.itemcluster( dat=dat, itemcluster=itemcluster )
summary(mod)

## Not run: 
##D # Rasch MML estimation
##D mod4 <- sirt::rasch.mml2( dat )
##D summary(mod4)
##D 
##D # Rasch Copula estimation
##D mod5 <- sirt::rasch.copula2( dat, itemcluster=itemcluster )
##D summary(mod5)
##D 
##D # compare different item parameter estimates
##D M1 <- cbind( "true.b"=bsamp,  "b.rasch"=mod4$item$b,
##D         "b.rasch.copula"=mod5$item$thresh,
##D         "b.rasch.pairwise"=mod3$b,
##D         "b.rasch.pairwise.cluster"=mod$b
##D       )
##D # center item difficulties
##D M1 <- scale( M1, scale=FALSE )
##D round( M1, 3 )
##D round( apply( M1, 2, stats::sd ), 3 )
##D 
##D #  Below the output of the example is presented.
##D #  It is surprising that the rasch.pairwise.itemcluster is pretty close
##D #  to the estimate in the Rasch copula model.
##D 
##D   ##   > M1 <- scale( M1, scale=F )
##D   ##   > round( M1, 3 )
##D   ##       true.b b.rasch b.rasch.copula b.rasch.pairwise b.rasch.pairwise.cluster
##D   ##   I1   0.545   0.561          0.526            0.628                    0.524
##D   ##   I2  -0.182  -0.168         -0.174           -0.121                   -0.156
##D   ##   I3  -0.909  -0.957         -0.867           -0.971                   -0.899
##D   ##   I4  -1.636  -1.726         -1.625           -1.765                   -1.611
##D   ##   I5   1.636   1.751          1.648            1.694                    1.649
##D   ##   I6   0.909   0.892          0.836            0.898                    0.827
##D   ##   I7  -2.000  -2.134         -2.020           -2.051                   -2.000
##D   ##   I8  -1.273  -1.355         -1.252           -1.303                   -1.271
##D   ##   I9  -0.545  -0.637         -0.589           -0.581                   -0.598
##D   ##   I10  1.273   1.378          1.252            1.308                    1.276
##D   ##   I11  0.182   0.241          0.226            0.109                    0.232
##D   ##   I12  2.000   2.155          2.039            2.154                    2.026
##D   ##   > round( apply( M1, 2, sd ), 3 )
##D   ##                     true.b                  b.rasch           b.rasch.copula
##D   ##                      1.311                    1.398                    1.310
##D   ##      b.rasch.pairwise    b.rasch.pairwise.cluster
##D   ##                 1.373                       1.310   
## End(Not run)

# set item parameters of first item to 0 and of second item to -0.7
b.fixed <- cbind( c(1,2), c(0,-.7) )
mod5 <- sirt::rasch.pairwise.itemcluster( dat=dat, b.fixed=b.fixed,
             itemcluster=itemcluster )
# difference between estimations 'mod' and 'mod5'
dfr <- cbind( mod5$item$b, mod$item$b )
plot( mod5$item$b, mod$item$b, pch=16)
apply( dfr, 1, diff )



