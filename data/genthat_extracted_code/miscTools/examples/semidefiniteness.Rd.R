library(miscTools)


### Name: isSemidefinite
### Title: Positive or Negative Semidefiniteness
### Aliases: isSemidefinite isSemidefinite.default isSemidefinite.list
###   isSemidefinite.matrix semidefiniteness
### Keywords: array

### ** Examples

   # a positive semidefinite matrix
   isSemidefinite( matrix( 1, 3, 3 ))

   # a negative semidefinite matrix
   isSemidefinite( matrix(-1, 3, 3 ), positive = FALSE )

   # a matrix that is positive and negative semidefinite
   isSemidefinite( matrix( 0, 3, 3 ))
   isSemidefinite( matrix( 0, 3, 3 ), positive = FALSE )

   # a matrix that is neither positive nor negative semidefinite
   isSemidefinite( symMatrix( 1:6 ) )
   isSemidefinite( symMatrix( 1:6 ), positive = FALSE )
   
   # checking a list of matrices
   ml <- list( matrix( 1, 3, 3 ), matrix(-1, 3, 3 ), matrix( 0, 3, 3 ) )
   isSemidefinite( ml )
   isSemidefinite( ml, positive = FALSE )



