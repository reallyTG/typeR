library(CDM)


### Name: reglca
### Title: Regularized Latent Class Analysis
### Aliases: reglca summary.reglca

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Estimating a regularized LCA for DINA data
##D #############################################################################
##D 
##D #---- simulate data
##D I <- 12  # number of items
##D # define Q-matrix
##D q.matrix <- matrix(0,I,2)
##D q.matrix[ 1:(I/3), 1 ] <- 1
##D q.matrix[ I/3 + 1:(I/3), 2 ] <- 1
##D q.matrix[ 2*I/3 + 1:(I/3), c(1,2) ] <- 1
##D N <- 1000  # number of persons
##D guess <- rep(seq(.1,.3,length=I/3), 3)
##D slip <- .1
##D rho <- 0.3  # skill correlation
##D set.seed(987)
##D dat <- CDM::sim.din( N=N, q.matrix=q.matrix, guess=guess, slip=slip,
##D     mean=0*c( .2, -.2 ), Sigma=matrix( c( 1, rho,rho,1), 2, 2 ) )
##D dat <- dat$dat
##D 
##D #--- Model 1: Four latent classes without regularization
##D mod1 <- CDM::reglca(dat=dat, nclasses=4, regular_lam=0, random_starts=3,
##D                random_iter=10, conv=1E-4)
##D summary(mod1)
##D 
##D #--- Model 2: Four latent classes with regularization
##D mod2 <- CDM::reglca(dat=dat, nclasses=4, regular_lam=0.03, regular_type="scad",
##D                random_starts=3, random_iter=10, conv=1E-4)
##D summary(mod2)
## End(Not run)



