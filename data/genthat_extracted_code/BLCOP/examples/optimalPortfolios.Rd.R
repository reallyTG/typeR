library(BLCOP)


### Name: optimalPortfolios
### Title: Calculates optimal portfolios under prior and posterior
###   distributions
### Aliases: optimalPortfolios optimalPortfolios.fPort
### Keywords: utilities

### ** Examples

	## Not run: 
##D 	    entries <- c(0.001005,0.001328,-0.000579,-0.000675,0.000121,0.000128,
##D                     -0.000445, -0.000437, 0.001328,0.007277,-0.001307,-0.000610,
##D                     -0.002237,-0.000989,0.001442,-0.001535, -0.000579,-0.001307,
##D                     0.059852,0.027588,0.063497,0.023036,0.032967,0.048039,-0.000675,
##D                     -0.000610,0.027588,0.029609,0.026572,0.021465,0.020697,0.029854,
##D                     0.000121,-0.002237,0.063497,0.026572,0.102488,0.042744,0.039943,
##D                     0.065994 ,0.000128,-0.000989,0.023036,0.021465,0.042744,0.032056,
##D                     0.019881,0.032235 ,-0.000445,0.001442,0.032967,0.020697,0.039943,
##D                     0.019881,0.028355,0.035064 ,-0.000437,-0.001535,0.048039,0.029854,
##D                     0.065994,0.032235,0.035064,0.079958 )
##D 	    
##D 	    varcov <- matrix(entries, ncol = 8, nrow = 8)
##D 	    mu <- c(0.08, 0.67,6.41, 4.08, 7.43, 3.70, 4.80, 6.60) / 100
##D 	    pick <- matrix(0, ncol = 8, nrow = 3, dimnames = list(NULL, letters[1:8]))
##D 	    pick[1,7] <- 1
##D 	    pick[2,1] <- -1; pick[2,2] <- 1
##D 	    pick[3, 3:6] <- c(0.9, -0.9, .1, -.1)
##D 	    confidences <- 1 / c(0.00709, 0.000141, 0.000866)
##D 	    views <- BLViews(pick, c(0.0525, 0.0025, 0.02), confidences, letters[1:8])
##D 	    posterior <- posteriorEst(views, tau = 0.025, mu, varcov )
##D 	    optimalPortfolios(posterior, doPlot = TRUE)
##D     
##D     	optimalPortfolios.fPort(posterior, optimizer = "tangencyPortfolio")
##D     	
##D     	# An example based on one found in "Beyond Black-Litterman:Views on Non-normal Markets"
##D         dispersion <- c(.376,.253,.360,.333,.360,.600,.397,.396,.578,.775) / 1000
##D         sigma <- BLCOP:::.symmetricMatrix(dispersion, dim = 4)
##D         caps <- rep(1/4, 4)
##D         mu <- 2.5 * sigma ##D 
##D         dim(mu) <- NULL
##D         marketDistribution <- mvdistribution("mt", mean = mu, S = sigma, df = 5 )
##D         pick <- matrix(0, ncol = 4, nrow = 1, dimnames = list(NULL, c("SP", "FTSE", "CAC", "DAX")))
##D         pick[1,4] <- 1
##D         vdist <- list(distribution("unif", min = -0.02, max = 0))
##D     
##D         views <- COPViews(pick, vdist, 0.2, c("SP", "FTSE", "CAC", "DAX"))
##D         posterior <- COPPosterior(marketDistribution, views)
##D     
##D         optimalPortfolios.fPort(myPosterior, spec = NULL, optimizer = "minriskPortfolio", 
##D 		                        inputData = NULL, numSimulations  = 100	)
##D 	
##D     
## End(Not run)



