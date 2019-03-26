library(sirt)


### Name: fuzcluster
### Title: Clustering for Continuous Fuzzy Data
### Aliases: fuzcluster summary.fuzcluster
### Keywords: Fuzzy data Clustering summary

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: 2 classes and 3 items
##D #############################################################################
##D 
##D #*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
##D # simulate data (2 classes and 3 items)
##D set.seed(876)
##D library(mvtnorm)
##D Ntot <- 1000  # number of subjects
##D # define SDs for simulating uncertainty
##D sd_uncertain <- c( .2, 1, 2 )
##D 
##D dat_m <- NULL   # data frame containing mean of membership function
##D dat_s <- NULL   # data frame containing SD of membership function
##D 
##D # *** Class 1
##D pi_class <- .6
##D Nclass <- Ntot * pi_class
##D mu <- c(3,1,0)
##D Sigma <- diag(3)
##D # simulate data
##D dat_m1 <- mvtnorm::rmvnorm( Nclass, mean=mu, sigma=Sigma )
##D dat_s1 <- matrix( stats::runif( Nclass * 3 ), nrow=Nclass )
##D for ( ii in 1:3){ dat_s1[,ii] <- dat_s1[,ii] * sd_uncertain[ii] }
##D dat_m <- rbind( dat_m, dat_m1 )
##D dat_s <- rbind( dat_s, dat_s1 )
##D 
##D # *** Class 2
##D pi_class <- .4
##D Nclass <- Ntot * pi_class
##D mu <- c(0,-2,0.4)
##D Sigma <- diag(c(0.5, 2, 2 ) )
##D # simulate data
##D dat_m1 <- mvtnorm::rmvnorm( Nclass, mean=mu, sigma=Sigma )
##D dat_s1 <- matrix( stats::runif( Nclass * 3 ), nrow=Nclass )
##D for ( ii in 1:3){ dat_s1[,ii] <- dat_s1[,ii] * sd_uncertain[ii] }
##D dat_m <- rbind( dat_m, dat_m1 )
##D dat_s <- rbind( dat_s, dat_s1 )
##D colnames(dat_s) <- colnames(dat_m) <- paste0("I", 1:3 )
##D 
##D #*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-
##D # estimation
##D 
##D #*** Model 1: Clustering with 8 random starts
##D res1 <- sirt::fuzcluster(K=2,dat_m, dat_s, nstarts=8, maxiter=25)
##D summary(res1)
##D   ##  Number of iterations=22 (Seed=5090 )
##D   ##  ---------------------------------------------------
##D   ##  Class probabilities (2 Classes)
##D   ##  [1] 0.4083 0.5917
##D   ##
##D   ##  Means
##D   ##           I1      I2     I3
##D   ##  [1,] 0.0595 -1.9070 0.4011
##D   ##  [2,] 3.0682  1.0233 0.0359
##D   ##
##D   ##  Standard deviations
##D   ##         [,1]   [,2]   [,3]
##D   ##  [1,] 0.7238 1.3712 1.2647
##D   ##  [2,] 0.9740 0.8500 0.7523
##D 
##D #*** Model 2: Clustering with one start with seed 4550
##D res2 <- sirt::fuzcluster(K=2,dat_m, dat_s, nstarts=1, seed=5090 )
##D summary(res2)
##D 
##D #*** Model 3: Clustering for crisp data
##D #             (assuming no uncertainty, i.e. dat_s=0)
##D res3 <- sirt::fuzcluster(K=2,dat_m, dat_s=0*dat_s, nstarts=30, maxiter=25)
##D summary(res3)
##D   ##  Class probabilities (2 Classes)
##D   ##  [1] 0.3645 0.6355
##D   ##
##D   ##  Means
##D   ##           I1      I2      I3
##D   ##  [1,] 0.0463 -1.9221  0.4481
##D   ##  [2,] 3.0527  1.0241 -0.0008
##D   ##
##D   ##  Standard deviations
##D   ##         [,1]   [,2]   [,3]
##D   ##  [1,] 0.7261 1.4541 1.4586
##D   ##  [2,] 0.9933 0.9592 0.9535
##D 
##D #*** Model 4: kmeans cluster analysis
##D res4 <- stats::kmeans( dat_m, centers=2 )
##D   ##   K-means clustering with 2 clusters of sizes 607, 393
##D   ##   Cluster means:
##D   ##             I1        I2          I3
##D   ##   1 3.01550780  1.035848 -0.01662275
##D   ##   2 0.03448309 -2.008209  0.48295067
## End(Not run)



