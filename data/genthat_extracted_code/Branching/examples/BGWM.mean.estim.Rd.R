library(Branching)


### Name: BGWM.mean.estim
### Title: Estimation of the mean matrix of a multi-type Bienayme - Galton
###   - Watson process
### Aliases: BGWM.mean.estim BGWM.mean.EE BGWM.mean.MLE
### Keywords: Bienayme - Galton - Watson multi-type branching estimation
###   mean

### ** Examples

## Not run: 
##D ## Estimation of mean matrix from simulated data
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
##D # mean matrix of the process from its offspring distributions
##D m <- BGWM.mean(Dists.i,"independents",d)
##D 
##D # generated trajectories of the process from its offspring distributions
##D simulated.data <- rBGWM(Dists.i, "independents", d, n, N, 
##D                         TRUE, FALSE, FALSE)$o.c.s
##D 
##D # mean matrix empiric estimate from generated trajectories of the process
##D m.EE <- BGWM.mean.estim( simulated.data, "EE", d, n, N )$m
##D 
##D # mean matrix maximum likelihood estimate from generated trajectories
##D # of the process 
##D m.MLE <- BGWM.mean.estim( simulated.data, "MLE", d, n, N )$m
##D 
##D # Comparison of exact and estimated mean matrices
##D m
##D m - m.EE
##D m - m.MLE
## End(Not run)



