library(Branching)


### Name: rBGWM
### Title: Simulating a multi-type Bienayme - Galton - Watson process
### Aliases: rBGWM rBGWM.gener rBGWM.indep rBGWM.multinom
### Keywords: Bienayme - Galton - Watson multytipe branching generate
###   random

### ** Examples

## Not run: 
##D ## Simulation based on a model analyzed in Stefanescu(1998)
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
##D rA <- rBGWM(Dists.i, "independents", d, n, N)
##D 
##D # with multinomial distributions
##D dist <- data.frame( name=rep( "pois", d ),
##D                     param1=a*d,
##D                     stringsAsFactors=FALSE )
##D matrix.b <- matrix( rep(0.5, 4), nrow=2 )
##D Dists.m <- list( dists.eta=dist, matrix.B=matrix.b )
##D 
##D rB <- rBGWM(Dists.m, "multinomial", d, n, N)
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
##D rC <- rBGWM(Dists.g, "general", d, n, N)
##D 
##D # Comparison chart
##D dev.new()
##D plot.ts(rA$o.tt.s,main="with independents")
##D dev.new()
##D plot.ts(rB$o.tt.s,main="with multinomial")
##D dev.new()
##D plot.ts(rC$o.tt.s,main="with general (aprox.)")
## End(Not run)



