library(roahd)


### Name: plus-.fData
### Title: Operator '+' and '-' for 'fData' objects
### Aliases: plus-.fData +.fData -.fData

### ** Examples

fD = fData( seq( 0, 1, length.out = 10 ),
            values = matrix( seq( 1, 10 ),
                             nrow = 21, ncol = 10, byrow = TRUE ) )
fD + 1 : 10

fD + array( 1, dim = c( 1, 10 ) )

fD + fD

fD = fData( seq( 0, 1, length.out = 10 ),
            values = matrix( seq( 1, 10 ),
                             nrow = 21, ncol = 10, byrow = TRUE ) )
fD - 2 : 11

fD - array( 1, dim = c( 1, 10 ) )

fD - fD




