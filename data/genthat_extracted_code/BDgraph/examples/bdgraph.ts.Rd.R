library(BDgraph)


### Name: bdgraph.ts
### Title: Search algorithm in time series graphical models
### Aliases: bdgraph.ts

### ** Examples

## Not run: 
##D # Generating time series data
##D Nlength = 100; N = 150; p = 6; b = 3; threshold = 1e-8;
##D 
##D I = diag( p )
##D A = 0.5 * matrix( rbinom( p * p, 1, 0.2 ), p, p )
##D 
##D A[ lower.tri( A ) ] = 0
##D diag( A )           = 0.5
##D 
##D G = matrix( 0, p, p )
##D K = matrix( 0, p, p * Nlength )
##D 
##D lambda  = seq( 0, Nlength - 1, 1 ) * 2 * base::pi / Nlength
##D K0      = matrix( 0, p, p * Nlength )
##D K_times = matrix( 1, p, p )
##D 
##D for( k in 1 : Nlength )
##D { # Compute K0
##D     K0[ , ( k * p - p + 1 ) : ( k * p ) ] = I + t( A ) %*% A + 
##D         complex( 1, cos( -lambda[ k ] ), sin( -lambda[ k ] ) ) * A +
##D         complex( 1, cos( lambda[ k ] ), sin( lambda[ k ] ) ) * t( A )
##D     
##D     K_times = K_times * ( K0[ , ( k * p - p + 1 ) : ( k * p ) ] != 0 )
##D     diag( K[ , ( k * p - p + 1 ) : ( k * p ) ] ) = 1
##D }
##D 
##D G0         = K_times
##D diag( G0 ) = 0
##D 
##D D = K
##D # d is the Fourier coefficients of X
##D d = array( 0, c( p, Nlength, N ) )
##D x = array( 0, c( p, Nlength, N ) )
##D 
##D for( n in 1 : N )
##D { # Generate X
##D     e = matrix( rnorm( p * Nlength ), p, Nlength )
##D     
##D     x[ , 1, n ] = e[ , 1 ]
##D     for( t in 2 : Nlength )
##D         x[ , t, n ] = A %*% x[ , t - 1, n ] + e[ , t ]
##D }
##D 
##D P = 0 * D
##D for( n in 1 : N )
##D { # Compute Pk
##D     X = x[ , , n ]
##D     
##D     for( i in 1 : p )
##D         d[ i, , n ] = fft( X[ i, ] )
##D     
##D     for( i in 1 : Nlength )
##D         P[,(i*p-p+1):(i*p)] = P[,(i*p-p+1):(i*p)]+d[,i,n] %*% t(Conj(d[,i,n]))
##D }
##D 
##D bdgraph.obj = bdgraph.ts( P, Nlength, N, iter = 1000 )
##D 
##D summary( bdgraph.obj )
##D 
##D compare( G0, bdgraph.obj, vis = TRUE )
## End(Not run)



