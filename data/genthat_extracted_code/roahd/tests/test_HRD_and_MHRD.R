
# CHECKING HRD AND MHRD ---------------------------------------------------

time_grid = seq( 0, 1, length.out = 1e2 )

D = matrix( c( sin( 2 * pi * time_grid ) + 10,
               sin( 2 * pi * time_grid ) + 9,
               sin( 2 * pi * time_grid ) + 8,
               sin( 2 * pi * time_grid ) + 7,
               sin( 2 * pi * time_grid ) + 6,
               sin( 2 * pi * time_grid ) + 5,
               sin( 2 * pi * time_grid ) + 4,
               sin( 2 * pi * time_grid ) + 3,
               sin( 2 * pi * time_grid ) + 2,
               sin( 2 * pi * time_grid ) + 1,
               sin( 2 * pi * time_grid ) + 0,
               sin( 2 * pi * time_grid ) - 1,
               sin( 2 * pi * time_grid ) - 2,
               sin( 2 * pi * time_grid ) - 3,
               sin( 2 * pi * time_grid ) - 4,
               sin( 2 * pi * time_grid ) - 5,
               sin( 2 * pi * time_grid ) - 6,
               sin( 2 * pi * time_grid ) - 7,
               sin( 2 * pi * time_grid ) - 8,
               sin( 2 * pi * time_grid ) - 9,
               sin( 2 * pi * time_grid ) - 10),
            nrow = 21, ncol = length( time_grid ), byrow = T )

N = nrow( D )

id_vector = 1 : N

test_that( "Correctness of HRD",
           expect_equal( HRD( D ), mapply( min, id_vector / N, ( N - id_vector + 1 ) / N  ) ) )

test_that( "Correctness of MHRD",
           expect_equal( MHRD( D ), mapply( min, id_vector / N, ( N - id_vector + 1 ) / N  ) ) )


# TEST BY JAMES LONG (TAMU) -------------------------------------------------------------------

yints = c( 1.27, .927, 1/2, .217, 0)
slopes = c( -1, -1, 0, 1, 1 )
time_grid = ( 0 : 100 ) / 100

Data = matrix( 0, nrow = length( yints ),
               ncol = length( time_grid ) )

for( i in 1 : length( yints ) )

  Data[ i, ] = yints[ i ] + time_grid * slopes[ i ]

test_that( "Correctness of HRD - James Long test",
           expect_equal( HRD( Data ), rep( 0.2, 5 ) ) )


