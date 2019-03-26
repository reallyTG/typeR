library(Epi)


### Name: in.span
### Title: Is 'x' in the column span of matrix 'A' and what columns are
###   linearly dependent?
### Aliases: in.span inSpan id.span idSpan thinCol
### Keywords: math

### ** Examples

# Matrices and vectors, x in span(A), z (hopefully) not
A <- matrix(round(rnorm(15)*20),5,3)
B <- matrix(round(rnorm(15)*20),5,3)
B <- cbind( B, B%*%c(3,4,2) )
x <- A %*% c(3,4,2)
z <- 5:9

# how they look
data.frame( A=A, x=x, z=z, B=B )

# vectors in span(A)?
in.span(A,x)
in.span(x,A)
in.span(A,x,coef=TRUE)

in.span(A,z)
in.span(A,z,coef=TRUE)

# Do matrices span the same space ?
in.span( A, B )
in.span( B, A )

# B is not in span of a subspace of B columns, but vice versa
( M <- matrix( rnorm(8)*7, 4, 2 ) )
in.span( B%*%M, B )
in.span( B, B%*%M )
id.span( B, B%*%M )

# But not unique for singular matrices:
( xx <- in.span( B, B%*%M, coef=TRUE ) )
cbind( B%*%M, B%*%xx )
cbind( xx, M )

# Easier for full rank matrices:
( K <- matrix( rnorm(9)*7, 3, 3 ) )
in.span( A%*%K, A )
in.span( A, A%*%K )
id.span( A, A%*%K )
in.span( A, A%*%K, coef=TRUE )



