library(BLCOP)


### Name: Build Views
### Title: Create or add to a BLViews object
### Aliases: addBLViews addCOPViews BLViews COPViews newPMatrix
### Keywords: datagen manip

### ** Examples

    ### example from T. M. Idzorek's paper "A STEP-BY-STEP GUIDE TO THE 
	### BLACK-LITTERMAN MODEL"
 	## Not run: 
##D 	    pick <- newPMatrix(letters[1:8], 3)
##D 	    pick[1,7] <- 1
##D 	    pick[2,1] <- -1 
##D 	    pick[2,2] <- 1
##D 	    pick[3, 3:6] <- c(0.9, -0.9, .1, -.1)
##D 	    confidences <- 1 / c(0.00709, 0.000141, 0.000866)
##D 	    myViews <- BLViews(pick, q = c(0.0525, 0.0025, 0.02), confidences, letters[1:8])
##D 	    myViews
##D 	    
##D 	    ### Modified COP example from Meucci's "Beyond Black-Litterman: Views on
##D 		### non-normal markets" 
##D 	    dispersion <- c(.376,.253,.360,.333,.360,.600,.397,.396,.578,.775) / 1000
##D 	    sigma <- BLCOP:::.symmetricMatrix(dispersion, dim = 4)
##D 	    caps <- rep(1/4, 4)
##D 	    mu <- 2.5 * sigma ##D 
##D 	    dim(mu) <- NULL
##D 	    marketDistribution <- mvdistribution("mt", mean = mu, S = sigma, df = 5 )
##D 	    pick <- newPMatrix(c("SP", "FTSE", "CAC", "DAX"), 1)
##D 	    pick[1,4] <- 1
##D 	    vdist <- list(distribution("unif", min = -0.02, max = 0))
##D 	    views <- COPViews(pick, vdist, 0.2, c("SP", "FTSE", "CAC", "DAX"))
##D     
## End(Not run)



