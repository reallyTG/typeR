library(roahd)


### Name: times-.fData
### Title: Operator '*' and '/' for 'fData' objects
### Aliases: times-.fData *.fData /.fData

### ** Examples


N = 11
fD = fData( seq( 0, 1, length.out = 10 ),
            values = matrix( seq( 1, 10 ),
                             nrow = N, ncol = 10, byrow = TRUE ) )
fD * 2

fD * seq( 1, N )


N = 11
fD = fData( seq( 0, 1, length.out = 10 ),
            values = matrix( seq( 1, 10 ),
                             nrow = N, ncol = 10, byrow = TRUE ) )
fD / 2

fD / rep( 10, N )




