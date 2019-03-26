library(miceadds)


### Name: mice.impute.2lonly.function
### Title: Imputation at Level 2 (in 'miceadds')
### Aliases: mice.impute.2lonly.function

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Imputation of level 2 variables
##D #############################################################################
##D 
##D #**** Simulate some data
##D # x,y ... level 1 variables
##D # v,w ... level 2 variables
##D 
##D set.seed(987)
##D G <- 250            # number of groups
##D n <- 20             # number of persons
##D beta <- .3          # regression coefficient
##D rho <- .30          # residual intraclass correlation
##D rho.miss <- .10     # correlation with missing response
##D missrate <- .50     # missing proportion
##D y1 <- rep( stats::rnorm( G, sd=sqrt(rho)), each=n ) + stats::rnorm(G*n, sd=sqrt(1-rho))
##D w <- rep( round( stats::rnorm(G ), 2 ), each=n )
##D v <- rep( round( stats::runif( G, 0, 3 ) ), each=n )
##D x <-  stats::rnorm( G*n )
##D y <- y1 + beta  * x + .2 * w + .1 * v
##D dfr0 <- dfr <- data.frame( "group"=rep(1:G, each=n ), "x"=x, "y"=y,
##D         "w"=w, "v"=v )
##D dfr[ rho.miss * x + stats::rnorm( G*n, sd=sqrt( 1 - rho.miss ) ) <
##D           stats::qnorm(missrate), y" ] <- NA
##D dfr[ rep( stats::rnorm(G), each=n ) < stats::qnorm(missrate), "w" ] <- NA
##D dfr[ rep( stats::rnorm(G), each=n ) < stats::qnorm(missrate), "v" ] <- NA
##D 
##D #* initial predictor matrix and imputation methods
##D predM <- mice::make.predictorMatrix(data=dat)
##D impM <- mice::make.method(data=dat)
##D 
##D #...
##D # multilevel imputation
##D predM1 <- predM
##D predM1[c("w","v","y"),"group"] <- c(0,0,-2)
##D predM1["y","x"] <- 1        # fixed x effects imputation
##D impM1 <- impM
##D impM1[c("y","w","v")] <- c("2l.continuous", "2lonly.function", "2lonly.function" )
##D # define imputation functions
##D imputationFunction <- list( "w"="sample", "v"="pmm5" )
##D # define cluster variable
##D cluster_var <- list( "w"="group", "v"="group" )
##D 
##D # impute
##D imp1 <- mice::mice( as.matrix(dfr), m=1, predictorMatrix=predM1, method=impM1, maxit=5,
##D             imputationFunction=imputationFunction, cluster_var=cluster_var )
## End(Not run)



