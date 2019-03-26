library(roahd)


### Name: area_ordered
### Title: Area-under-curve order relation between univariate functional
###   data
### Aliases: area_ordered

### ** Examples


P = 1e3

grid = seq( 0, 1, length.out = P )

Data_1 = matrix( c( 1 * grid,
                    2 *  grid ),
                 nrow = 2, ncol = P, byrow = TRUE )

Data_2 = matrix( 3 * ( 0.5 - abs( grid - 0.5 ) ),
                 nrow = 1, byrow = TRUE )

Data_3 = rbind( Data_1, Data_1 )


fD_1 = fData( grid, Data_1 )
fD_2 = fData( grid, Data_2 )
fD_3 = fData( grid, Data_3 )

area_ordered( fD_1, fD_2 )

area_ordered( fD_2, fD_3 )




