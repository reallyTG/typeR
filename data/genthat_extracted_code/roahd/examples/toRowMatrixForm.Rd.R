library(roahd)


### Name: toRowMatrixForm
### Title: Conversion of vector/array/matrix to row-matrix form
### Aliases: toRowMatrixForm

### ** Examples


toRowMatrixForm( 1 : 10 )

toRowMatrixForm( array( 1 : 10, dim = c(1,10 ) ) )

toRowMatrixForm( array( 1 : 10, dim = c( 10, 1 ) ) )

toRowMatrixForm( matrix( 1 : 10, ncol = 10, nrow = 1 ) )

toRowMatrixForm( matrix( 1 : 10, ncol = 1, nrow = 10 ) )

toRowMatrixForm( matrix( 1 : 12, ncol = 3, nrow = 4 ) )

toRowMatrixForm( matrix( 1 : 12, ncol = 4, nrow = 3 ) )




