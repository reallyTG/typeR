library(roahd)


### Name: area_under_curve
### Title: Area under curve of elements of univariate functional data
### Aliases: area_under_curve

### ** Examples


P = 1e3
grid = seq( 0, 1, length.out = P )

fD = fData( grid,
            matrix( c( sin( 2 * pi * grid ),
                       cos( 2 * pi * grid ),
                       4 * grid * ( 1 - grid ) ),
                    nrow = 3, ncol = P, byrow = TRUE ) )
plot( fD )

area_under_curve( fD )




