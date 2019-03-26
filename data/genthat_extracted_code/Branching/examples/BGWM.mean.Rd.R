library(Branching)


### Name: BGWM.mean
### Title: Means of a multi-type Bienayme - Galton - Watson process
### Aliases: BGWM.mean BGWM.gener.mean BGWM.indep.mean BGWM.multinom.mean
### Keywords: Bienayme - Galton - Watson multi-type branching mean

### ** Examples

## Not run: 
##D ## Means of a BGWM process based on a model analyzed in Stefanescu (1998)
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
##D # mean matrix of the process
##D I.matriz.m <- BGWM.mean(Dists.i, "independents", d)
##D 
##D # mean vector of the population in the nth generation
##D # from vector N representing the initial population
##D I.vector.m.n_N <- BGWM.mean(Dists.i, "independents", d, n, N)
##D 
##D # with multinomial distributions
##D dist <- data.frame( name=rep( "pois", d ),
##D                     param1=a*d,
##D                     stringsAsFactors=FALSE )
##D matrix.b <- matrix( rep(0.5, 4), nrow=2 )
##D Dists.m <- list( dists.eta=dist, matrix.B=matrix.b )
##D 
##D # mean matrix of the process
##D M.matrix.m <- BGWM.mean(Dists.m, "multinomial", d)
##D 
##D # mean vector of the population in the nth generation
##D # from vector N representing the initial population
##D M.vector.m.n_N <- BGWM.mean(Dists.m, "multinomial", d, n, N)
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
##D # mean matrix of the process
##D G.matrix.m <- BGWM.mean(Dists.g, "general", d)
##D 
##D # mean vector of the population in the nth generation
##D # from vector N representing the initial population
##D G.vector.m.n_N <- BGWM.mean(Dists.g, "general", d, n, N)
##D 
##D # Comparison of results
##D I.vector.m.n_N
##D I.vector.m.n_N - M.vector.m.n_N
##D M.vector.m.n_N - G.vector.m.n_N
##D G.vector.m.n_N - I.vector.m.n_N
## End(Not run)



