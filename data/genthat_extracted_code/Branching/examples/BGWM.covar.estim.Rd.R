library(Branching)


### Name: BGWM.covar.estim
### Title: Estimation of the covariance matrices of a multi-type Bienayme -
###   Galton - Watson process
### Aliases: BGWM.covar.estim BGWM.covar.EE BGWM.covar.MLE
### Keywords: Bienayme - Galton - Watson multi-type branching estimation
###   variance covariance

### ** Examples

## Not run: 
##D ## Estimation of covariace matrices from simulated data
##D 
##D # Variables and parameters
##D d <- 3
##D n <- 30
##D N <- c(10,10,10)
##D LeslieMatrix <- matrix( c(0.08, 1.06, 0.07, 
##D                           0.99, 0, 0, 
##D                           0, 0.98, 0), 3, 3 )
##D 
##D # offspring distributions from the Leslie matrix
##D # (with independent distributions)  
##D Dists.pois <- data.frame( name=rep( "pois", d ),
##D                           param1=LeslieMatrix[,1],
##D                           param2=NA,
##D                           stringsAsFactors=FALSE )
##D Dists.binom <- data.frame( name=rep( "binom", 2*d ),
##D                            param1=rep( 1, 2*d ),
##D                            param2=c(t(LeslieMatrix[,-1])),
##D                            stringsAsFactors=FALSE ) 
##D Dists.i <- rbind(Dists.pois,Dists.binom)
##D Dists.i <- Dists.i[c(1,4,5,2,6,7,3,8,9),]
##D Dists.i
##D 
##D # covariance matrices of the process from its offspring distributions
##D V <- BGWM.covar(Dists.i,"independents",d)
##D 
##D # generated trajectories of the process from its offspring distributions
##D simulated.data <- rBGWM(Dists.i, "independents", d, n, N, 
##D                         TRUE, FALSE, FALSE)$o.c.s
##D 
##D # estimation of covariance matrices using mean matrix empiric estimate
##D # from generated trajectories of the process 
##D V.EE.m <- BGWM.covar.estim( simulated.data, "EE-m", d, n, N )$V
##D 
##D # estimation of covariance matrices using mean matrix maximum likelihood
##D # estimate from generated trajectories of the process 
##D V.MLE.m <- BGWM.covar.estim( simulated.data, "MLE-m", d, n, N )$V
##D 
##D # Comparison of exact and estimated covariance matrices
##D V
##D V - V.EE.m
##D V - V.MLE.m
## End(Not run)



