library(BLCOP)


### Name: densityPlots
### Title: Density plots of prior and posterior distributions
### Aliases: densityPlots
### Keywords: hplot

### ** Examples

    ## Not run: 
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
##D         densityPlots(posterior, 4)
##D         
## End(Not run)



