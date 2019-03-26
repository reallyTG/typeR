library(roahd)


### Name: maxima
### Title: Maxima of a univariate functional dataset
### Aliases: maxima

### ** Examples


P = 1e3

grid = seq( 0, 1, length.out = P )

Data = matrix( c( 1 * grid,
                  2 *  grid,
                  3 * ( 0.5 - abs( grid - 0.5 ) ) ),
               nrow = 3, ncol = P, byrow = TRUE )

fD = fData( grid, Data )

maxima( fD, which = TRUE )




