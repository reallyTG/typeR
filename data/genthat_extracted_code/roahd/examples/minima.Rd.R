library(roahd)


### Name: minima
### Title: Minima of a univariate functional dataset
### Aliases: minima

### ** Examples


P = 1e3

grid = seq( 0, 1, length.out = P )

Data = matrix( c( 1 * grid,
                  2 *  grid,
                  3 * ( 0.5 - abs( grid - 0.5 ) ) ),
               nrow = 3, ncol = P, byrow = TRUE )

fD = fData( grid, Data )

minima( fD, which = TRUE )




