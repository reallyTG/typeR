library(roahd)


### Name: MBD_relative
### Title: Relative Modified Band Depth of functions in a univariate
###   functional dataset
### Aliases: MBD_relative MBD_relative.fData MBD_relative.default

### ** Examples


grid = seq( 0, 1, length.out = 1e2 )

Data_ref = matrix( c( 0  + sin( 2 * pi * grid ),
                      1  + sin( 2 * pi * grid ),
                      -1 + sin( 2 * pi * grid ) ),
                   nrow = 3, ncol = length( grid ), byrow = TRUE )

Data_test_1 = matrix( c( 0.6 + sin( 2 * pi * grid ) ),
                      nrow = 1, ncol = length( grid ), byrow = TRUE )

Data_test_2 = matrix( c( 0.6 + sin( 2 * pi * grid ) ),
                      nrow = length( grid ), ncol = 1, byrow = TRUE )

Data_test_3 = 0.6 + sin( 2 * pi * grid )

Data_test_4 = array( 0.6 + sin( 2 * pi * grid ), dim = length( grid ) )

Data_test_5 = array( 0.6 + sin( 2 * pi * grid ), dim = c( 1, length( grid ) ) )

Data_test_6 = array( 0.6 + sin( 2 * pi * grid ), dim = c( length( grid ), 1 ) )

Data_test_7 = matrix( c( 0.5  + sin( 2 * pi * grid ),
                         -0.5 + sin( 2 * pi * grid ),
                         1.1 + sin( 2 * pi * grid ) ),
                      nrow = 3, ncol = length( grid ), byrow = TRUE )

fD_ref = fData( grid, Data_ref )
fD_test_1 = fData( grid, Data_test_1 )
fD_test_2 = fData( grid, Data_test_2 )
fD_test_3 = fData( grid, Data_test_3 )
fD_test_4 = fData( grid, Data_test_4 )
fD_test_5 = fData( grid, Data_test_5 )
fD_test_6 = fData( grid, Data_test_6 )
fD_test_7 = fData( grid, Data_test_7 )

MBD_relative( fD_test_1, fD_ref )
MBD_relative( Data_test_1, Data_ref )

MBD_relative( fD_test_2, fD_ref )
MBD_relative( Data_test_2, Data_ref )

MBD_relative( fD_test_3, fD_ref )
MBD_relative( Data_test_3, Data_ref )

MBD_relative( fD_test_4, fD_ref )
MBD_relative( Data_test_4, Data_ref )

MBD_relative( fD_test_5, fD_ref )
MBD_relative( Data_test_5, Data_ref )

MBD_relative( fD_test_6, fD_ref )
MBD_relative( Data_test_6, Data_ref )

MBD_relative( fD_test_7, fD_ref )
MBD_relative( Data_test_7, Data_ref )





