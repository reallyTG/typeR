library(Branching)


### Name: BGWM.covar
### Title: Variances and covariances of a multi-type Bienayme - Galton -
###   Watson process
### Aliases: BGWM.covar BGWM.gener.covar BGWM.indep.covar
###   BGWM.multinom.covar
### Keywords: Bienayme - Galton - Watson multi-type branching variance
###   covariance

### ** Examples

## Not run: 
##D ## Variances and covariances of a BGWM process based on a model analyzed
##D ## in Stefanescu (1998) 
##D 
##D # Variables and parameters
##D d <- 2
##D n <- 30
##D N <- c(90, 10)
##D a <- c(0.2, 0.3)
##D 
##D # with independent distributions
##D Dists.i <- data.frame( name=rep( "pois", d*d ),
##D                        param1=rep( a, rep(d,d) ),
##D                        stringsAsFactors=FALSE )
##D 
##D # covariance matrices of the process
##D I.matriz.V <- BGWM.covar(Dists.i, "independents", d)
##D 
##D # covariance matrix of the population in the nth generation
##D # from vector N representing the initial population
##D I.matrix.V.n_N <- BGWM.covar(Dists.i, "independents", d, n, N)
##D 
##D # with multinomial distributions
##D dist <- data.frame( name=rep( "pois", d ),
##D                     param1=a*d,
##D                     stringsAsFactors=FALSE )
##D matrix.b <- matrix( rep(0.5, 4), nrow=2 )
##D Dists.m <- list( dists.eta=dist, matrix.B=matrix.b )
##D 
##D # covariance matrices of the process
##D M.matrix.V <- BGWM.covar(Dists.m, "multinomial", d)
##D 
##D # covariance matrix of the population in the nth generation
##D # from vector N representing the initial population
##D M.matrix.V.n_N <- BGWM.covar(Dists.m, "multinomial", d, n, N)
##D 
##D # with general distributions (approximation)
##D max <- 30
##D A <- t(expand.grid(c(0:max),c(0:max)))
##D aux1 <- factorial(A)
##D aux1 <- apply(aux1,2,prod)
##D aux2 <- apply(A,2,sum)
##D distp <- function(x,y,z){ exp(-d*x)*(x^y)/z }
##D p <- sapply( a, distp, aux2, aux1 )
##D prob <- list( dist1=p[,1], dist2=p[,2] )
##D size <- list( dist1=ncol(A), dist2=ncol(A) )
##D vect <- list( dist1=t(A), dist2=t(A) )
##D Dists.g <- list( sizes=size, probs=prob, vects=vect )
##D 
##D # covariance matrices of the process
##D G.matrix.V <- BGWM.covar(Dists.g, "general", d)
##D 
##D # covariance matrix of the population in the nth generation
##D # from vector N representing the initial population
##D G.matrix.V.n_N <- BGWM.covar(Dists.g, "general", d, n, N)
##D 
##D # Comparison of results
##D I.matrix.V.n_N
##D I.matrix.V.n_N - M.matrix.V.n_N
##D M.matrix.V.n_N - G.matrix.V.n_N
##D G.matrix.V.n_N - I.matrix.V.n_N
## End(Not run)



