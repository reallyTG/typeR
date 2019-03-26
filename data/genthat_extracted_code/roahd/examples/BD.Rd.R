library(roahd)


### Name: BD
### Title: Band Depth for univariate functional data
### Aliases: BD BD.fData BD.default

### ** Examples


grid = seq( 0, 1, length.out = 1e2 )


D = matrix( c( 1 + sin( 2 * pi * grid ),
               0 + sin( 4 * pi * grid ),
               1 - sin( pi * ( grid - 0.2 ) ),
               0.1 + cos( 2 * pi * grid ),
               0.5 + sin( 3 * pi + grid ),
               -2 + sin( pi * grid ) ),
            nrow = 6, ncol = length( grid ), byrow = TRUE )

fD = fData( grid, D )

BD( fD )

BD( D )




