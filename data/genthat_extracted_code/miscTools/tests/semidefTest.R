library( "miscTools" )

set.seed( 123 )

# not symmetric
m1 <- matrix( rnorm( 9 ), ncol = 3 )
print( m1 )
try( semidefiniteness( m1 ) )
try( semidefiniteness( m1, method = "eigen" ) )
try( semidefiniteness( m1, positive = FALSE ) )
try( semidefiniteness( m1, positive = FALSE, method = "eigen" ) )

# positive semidefinite
m2 <- crossprod( m1 )
print( m2 )
semidefiniteness( m2 )
semidefiniteness( m2, method = "eigen" )
semidefiniteness( m2, positive = FALSE )
semidefiniteness( m2, positive = FALSE, method = "eigen" )
# negative semidefinite
semidefiniteness( -m2 )
semidefiniteness( -m2, method = "eigen" )
semidefiniteness( -m2, positive = FALSE )
semidefiniteness( -m2, positive = FALSE, method = "eigen" )

# positive semidefinite, singular
m3 <- cbind( m2, - rowSums( m2 ) )
m3 <- rbind( m3, - colSums( m3 ) )
print( m3 )
semidefiniteness( m3 )
semidefiniteness( m3, method = "eigen" )
semidefiniteness( m3, positive = FALSE )
semidefiniteness( m3, positive = FALSE, method = "eigen" )

# positive semidefinite, singular, and large numbers
m4 <- m3 * 1e6
print( m4 )
# rcond(m4)
# det(m4)
semidefiniteness( m4 )
semidefiniteness( m4, method = "eigen" )
semidefiniteness( m4, positive = FALSE )
semidefiniteness( m4, positive = FALSE, method = "eigen" )

# negative semidefinite, diagonal
m5 <- diag( -1, 4, 4 )
print( m5 )
semidefiniteness( m5 )
semidefiniteness( m5, method = "eigen" )
semidefiniteness( m5, positive = FALSE )
semidefiniteness( m5, positive = FALSE, method = "eigen" )

# negative semidefinite, singular
m6 <- matrix( -1, 4, 4 )
print( m6 )
semidefiniteness( m6 )
semidefiniteness( m6, method = "eigen" )
semidefiniteness( m6, positive = FALSE )
semidefiniteness( m6, positive = FALSE, method = "eigen" )

# negative semidefinite, diagonal
m7 <- diag( c( -1, -3 ) )
print( m7 )
semidefiniteness( m7 )
semidefiniteness( m7, method = "eigen" )
semidefiniteness( m7, positive = FALSE )
semidefiniteness( m7, positive = FALSE, method = "eigen" )

# positive semidefinite
m8 <- symMatrix( c( 2, -1, 0, 2, -1, 2 ) )
print( m8 )
semidefiniteness( m8 )
semidefiniteness( m8, method = "eigen" )
semidefiniteness( m8, positive = FALSE )
semidefiniteness( m8, positive = FALSE, method = "eigen" )

# indefinite
m9 <- symMatrix( rnorm( 6 ) )
print( m9 )
semidefiniteness( m9 )
semidefiniteness( m9, method = "eigen" )
semidefiniteness( m9, positive = FALSE )
semidefiniteness( m9, positive = FALSE, method = "eigen" )

# positive and negative semidefinite
m10 <- matrix( 0, 3, 3 )
print( m10 )
semidefiniteness( m10 )
semidefiniteness( m10, method = "eigen" )
semidefiniteness( m10, positive = FALSE )
semidefiniteness( m10, positive = FALSE, method = "eigen" )

# indefinite
m11 <- symMatrix( 1:6 )
print( m11 )
semidefiniteness( m11 )
semidefiniteness( m11, method = "eigen" )
semidefiniteness( m11, positive = FALSE )
semidefiniteness( m11, positive = FALSE, method = "eigen" )

# indefinite, singular
m12 <- cbind( m9, - rowSums( m9 ) )
m12 <- rbind( m12, - colSums( m12 ) )
print( m12 )
semidefiniteness( m12 )
semidefiniteness( m12, method = "eigen" )
semidefiniteness( m12, positive = FALSE )
semidefiniteness( m12, positive = FALSE, method = "eigen" )

# indefinite, singular, small numbers
m13 <- m12 * 1e-6
print( m13 )
semidefiniteness( m13 )
semidefiniteness( m13, method = "eigen" )
semidefiniteness( m13, positive = FALSE )
semidefiniteness( m13, positive = FALSE, method = "eigen" )

# 'large' matrix
m14 <- symMatrix( 1:( 13 * (13+1) / 2 ) )
semidefiniteness( m14 )
semidefiniteness( m14, method = "det" )
semidefiniteness( m14, method = "eigen" )

# list, one element not a matrix
ml1 <- list( m2, c( m1 ), m3, m4 )
try( semidefiniteness( ml1 ) )

# list of matrices, one non-symmetric
ml2 <- list( m2, m1, m3, m4 )
try( semidefiniteness( ml2 ) )

# list of matrices, one 'large' matrix
ml3 <- list( m2, m14, m3, m4 )
semidefiniteness( ml3 )
semidefiniteness( ml3, method = "det" )
semidefiniteness( ml3, method = "eigen" )
semidefiniteness( ml3, positive = FALSE )
semidefiniteness( ml3, positive = FALSE, method = "det" )
semidefiniteness( ml3, positive = FALSE, method = "eigen" )
