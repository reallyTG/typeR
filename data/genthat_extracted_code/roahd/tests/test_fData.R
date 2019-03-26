

# TESTING FDATA -----------------------------------------------------------

N = 1e2

P = 1e3
t0 = 0
t1 = 1

time_grid = seq( t0, t1, length.out = P )

Cov = exp_cov_function( time_grid, alpha = 0.3, beta = 0.4 )

Data = generate_gauss_fdata( N, centerline = sin( 2 * pi * time_grid ), Cov = Cov )

test_that( 'Creation of fData object',
           expect_silent( fData( time_grid, Data ) ) )

fD = fData( time_grid, Data )

test_that( 'Plot of fData object',
           expect_silent( plot.fData( fData( time_grid, Data ),
                                      xlab = 'time', ylab = 'values',
                                      main = 'A functional dataset' ) ) )

test_that( 'Creation of 1-element fData object',
           expect_silent( fData( time_grid, 1 : P ) ) )


# TESTING STATISTICS OPERATIONS -------------------------------------------

test_that( 'Mean of fData object',
           expect_equal( as.numeric( mean( fD )$values ),
                         colMeans( fD$values ) ) )

test_that( 'Median of fData obejct - MBD',
           expect_equal( as.numeric( median_fData( fD )$value ),
                         fD$values[ which.max( MBD( fD$values ) ), ]) )

test_that( 'Median of fData object - MBD with ties',
           expect_equal( as.numeric( median_fData( fD, type = 'MBD',
                                             manage_ties = TRUE )$values ),
                         fD$values[ which.max( MBD( fD$values,
                                                    manage_ties = TRUE ) ), ] ) )

test_that( 'Median of fData obejct - MHRD',
           expect_equal( as.numeric( median_fData( fD, type = 'MHRD' )$value ),
                         fD$values[ which.max( MHRD( fD$values ) ), ]) )

test_that( 'Covariance of fData object',
           expect_equal( cov( fD$values ), cov_fun( fD )$values ) )

test_that( 'Covariance of fData object - error 1',
           expect_error( cov_fun( 1 ) ) )

test_that( 'Covariance of fData object - error 2',
           expect_error( cov_fun( fD, fD[-1,] )  ) )

test_that( 'Covariance of fData object - error 3',
           expect_error( cov_fun( fD, fD[,1:10] )  ) )

test_that( 'Cross covariance of fData objects',
           expect_equal( cov( fD$values, ( fD + 1 : P )$values ),
                         cov_fun( fD, fD + 1 : P )$values ) )

N = 1e2

P = 1e2
t0 = 0
t1 = 1

time_grid = seq( t0, t1, length.out = P )

Cov = exp_cov_function( time_grid, alpha = 0.3, beta = 0.4 )

Data = generate_gauss_fdata( N, centerline = sin( 2 * pi * time_grid ), Cov = Cov )

fD = fData( time_grid, Data )
mfD = mfData( time_grid, list( 'comp1' = Data, 'comp2' = Data, 'comp3' = Data ) )
mfD2 = mfData( time_grid, list( Data, Data, Data ) )
mfD3 = mfData( time_grid, list( Data, Data ) )

rhs = lapply( 1 : ( 2 * mfD$L ),
              function( i ) cov_fun( mfD$fDList[[1]] ) )
names( rhs ) = c( 'comp1_1', 'comp1_2', 'comp1_3',
                  'comp2_2', 'comp2_3',
                  'comp3_3' )


test_that( 'Cross covariance of mfData and mfData',
           expect_equal( cov_fun( mfD, mfD2 ),
                          rhs ) )

test_that( 'Cross covariance of mfData and fData',
           expect_equal( cov_fun( mfD2, fD ),
                         lapply( 1 : mfD$L,
                                 function( i ) cov_fun( mfD$fDList[[1]] ) ) ) )

test_that( 'Cross covariance of mfData and mfData - error ',
           expect_error( cov_fun( mfD, mfD3 ) ) )

test_that( 'Cross covariance of mfData and fData - error ',
           expect_error( cov_fun( mfD, fD[ , 1:10 ] ) ) )

test_that( 'Covariance of mfData - names 1',
           expect_equal( names( cov_fun( mfD ) ),
                         c( 'comp1_comp1', 'comp1_comp2', 'comp1_comp3',
                               'comp2_comp2', 'comp2_comp3',
                               'comp3_comp3' ) ) )

test_that( 'Covariance of mfData - names 2',
           expect_equal( names( cov_fun( mfD2 ) ),
                         c( '1_1', '1_2', '1_3',
                            '2_2', '2_3',
                            '3_3' ) ) )

# TESTING ALGEBRAIC OPERATIONS --------------------------------------------

fD = fData( seq( 0, 1, length.out = 10 ), values = matrix( seq( 1, 10 ),
                                                           nrow = 21, ncol = 10,
                                                           byrow = TRUE ) )

test_that( 'Sum of fData and raw vector',
           expect_equal( sum( ( fD + 1 : 10 )$values -
                                matrix( 2 * seq( 1, 10 ),  nrow = 21, ncol = 10,
                                        byrow = TRUE ) ), 0 ) )

test_that( 'Sum of fData and raw vector',
           expect_equal( sum( ( fD - 1 : 10 )$values ), 0 ) )

test_that( 'Sum of fData and array',
           expect_equal( sum( ( fD + array( 1, dim = c( 1, 10 ) ) )$values -
                                matrix( seq( 2, 11 ),
                                        nrow = 21, ncol = 10, byrow = TRUE ) ),
                         0 ) )

fD.2 = fData( seq( 0, 1, length.out = 11 ), values = matrix( seq( 1, 11 ),
                                                             nrow = 21, ncol = 11,
                                                             byrow = TRUE ) )

test_that( 'Sum of two compliant fData objects',
           expect_equal( sum( ( fD + fD -
                                  matrix( 2 * seq( 1, 10 ),
                                          nrow = 21, ncol = 10,
                                          byrow = TRUE ) )$values ), 0  ) )

test_that( 'Sum of two noncompliant fData objects',
           expect_error( fD + fD.2, regexp = 'Error.*') )

test_that( 'Product of fData object with scalar',
           expect_equal( fD * 2,  fD + fD ) )

test_that( 'Division of fData object by scalar',
           expect_equal( ( fD * 4 ) / 2, fD + fD ) )


# TESTING FUNCTIONAL DATA SUBSETTING --------------------------------------

test_that( 'Functional data subsetting - case 1',
           expect_identical( fD[ 1, ],
                             fData( seq( 0, 1, length.out = 10 ), 1 : 10 ) ) )

test_that( 'Functional data subsetting - case 2',
           expect_identical( fD[ , 1:2 ],
                             fData( seq( 0, 1, length.out = 10 )[1:2],
                                    matrix( 1 : 2,
                                            nrow = 21, ncol = 2,
                                            byrow = T ) ) ) )

test_that( 'Functional data subsetting - case 3',
           expect_identical( fD[ 1:2, 1:2, as_fData = FALSE ],
                             matrix( seq( 1, 2 ),
                                     nrow = 2, ncol = 2,
                                     byrow = TRUE ) ) )

fD_logical_subset = fD[ , c( rep( FALSE, 5 ), rep( TRUE, 5 ) ) ]

test_that( 'Functional data subsetting - case 4',
           expect_identical( fD_logical_subset$values,
                             matrix( seq( 6, 10 ),
                                     nrow = 21, ncol = 5,
                                     byrow = TRUE ) ) )

test_that( 'Functional data subsetting - case 4 bis',
           expect_identical( c( fD_logical_subset$t0, fD_logical_subset$tP, fD_logical_subset$h, fD_logical_subset$P ),
                             c( 5 * fD$h, 1, fD$h, 5 )  ) )

fD_logical_subset = fD[ , c( rep( TRUE, 5 ), rep( FALSE, 5 ) ) ]

test_that( 'Functional data subsetting - case 5',
           expect_identical( fD_logical_subset$values,
                             matrix( seq( 1, 5 ),
                                     nrow = 21, ncol = 5,
                                     byrow = TRUE ) ) )

test_that( 'Functional data subsetting - case 5 bis',
           expect_identical( c( fD_logical_subset$t0, fD_logical_subset$tP, fD_logical_subset$h, fD_logical_subset$P ),
                             c( 0, 4 * fD$h, fD$h, 5 )  ) )



N = 3
P = 20
L = 2

grid = seq( 0, 1, length.out = P )

values1 = rep( 1, P)
values2 = cos( 2 * pi * grid )
values3 = sin( 2 * pi * grid )

values4 = rep( 2, P)
values5 = cos( 4 * pi * grid )
values6 = sin( 4 * pi * grid )

mfD = mfData( grid, list( matrix( c( values1, values2, values3 ), nrow=3, ncol=P, byrow=TRUE),
                          matrix( c( values4, values5, values6 ), nrow=3, ncol=P, byrow=TRUE)) )


test_that( 'Multivariate functional data  subsetting - case 1',
           expect_error( mfD[ , c(1:5, 7:8)]))

test_that( 'Multivariate functional data subsetting - case 2',
           expect_equal( mfD[1,]$fDList[[1]]$values, t(as.matrix(values1)) ) )

test_that( 'Multivariate functional data subsetting - case 3',
           expect_equal( mfD[1,]$fDList[[2]]$values, t(as.matrix(values4)) ) )

test_that( 'Multivariate functional data subsetting - case 4',
           expect_equal( mfD[1:2,]$fDList[[1]]$values, matrix(c(values1, values2), nrow=2,
                                                              ncol=P, byrow=TRUE) ) )
test_that( 'Multivariate functional data subsetting - case 5',
           expect_equal( mfD[1:2,]$fDList[[2]]$values, matrix(c(values4, values5), nrow=2,
                                                              ncol=P, byrow=TRUE) ) )
test_that( 'Multivariate functional data subsetting - case 6',
           expect_equal( mfD[,1:5]$fDList[[1]]$values, matrix(c(values1[1:5], values2[1:5],
                                                                values3[1:5]), nrow=3,
                                                              ncol=5, byrow=TRUE) ) )
test_that( 'Multivariate functional data subsetting - case 7',
           expect_equal( mfD[,1:5]$fDList[[2]]$values, matrix(c(values4[1:5], values5[1:5],
                                                                values6[1:5]), nrow=3,
                                                              ncol=5, byrow=TRUE) ) )
test_that( 'Multivariate functional data subsetting - case 8',
           expect_true( (mfD[1:2,]$N == 2) & (mfD[1:2,]$P == P) & (mfD[1:2,]$L == 2 )))

test_that( 'Multivariate functional data appending - case 1',
           expect_equal( append_mfData(mfD[1:2,], mfD[3,])$fDList[[1]]$values, mfD$fDList[[1]]$values ))

test_that( 'Multivariate functional data appending - case 2',
           expect_equal( append_fData(mfD[1:2,]$fDList[[1]], mfD[3,]$fDList[[1]])$values,
                         mfD$fDList[[1]]$values ))

# TESTING MFDATA ----------------------------------------------------------

N = 1e2

P = 1e3

t0 = 0
t1 = 1

time_grid = seq( t0, t1, length.out = P )

Cov = exp_cov_function( time_grid, alpha = 0.3, beta = 0.4 )

Data_1 = generate_gauss_fdata( N, centerline = sin( 2 * pi * time_grid ), Cov = Cov )
Data_2 = generate_gauss_fdata( N, centerline = sin( 2 * pi * time_grid ), Cov = Cov )

test_that( 'Creation of mfData object',
           expect_silent( mfData( time_grid, list( Data_1, Data_2 ) ) ) )

test_that( 'Creation of 1-element mfData object',
           expect_silent( mfData( time_grid, list( 1 : P,
                                                  1 : P ) ) ) )

test_that( 'Plot of mfData object',
           expect_silent( plot.mfData( mfData( time_grid,
                                               list( Data_1, Data_2 ) ),
                                       xlab = 'time', ylab = list( 'values',
                                                                   'values' ),
                                       main = list( 'First Component',
                                                    'Second Component' ) ) ) )
mfD = mfData( time_grid,
              list( Data_1, Data_2 ))

test_that( 'Plotting a component',
           expect_silent( plot( mfD$fDList[[ 1 ]] ) ) )


test_that( 'As.mfdata.list',
           expect_silent( as.mfData( list( fData( time_grid,
                                                  Data_1 ),
                                           fData( time_grid,
                                                  Data_2 )
           ) ) )  )


test_that( 'Extracting list of values from multivariate functional dataset',
           expect_identical( toListOfValues( mfData( time_grid,
                                                     list( Data_1, Data_2 ) ) ),
                             list( Data_1, Data_2 ) ) )


# TESTING FUNCTIONAL DATA UNFOLDING ---------------------------------------

P = 1e3

t0 = 0
t1 = 1

time_grid = seq( t0, t1, length.out = P )

D = matrix( c( sin( 2 * pi * time_grid ),
               cos( 2 * pi * time_grid ),
               sin( 10 * pi * time_grid ) * time_grid + 2 ),
            ncol = P, nrow = 3, byrow = TRUE )

fD = fData( time_grid, D )

fD_unfold = unfold( fD )

# Ana's implementation
mon_func = function( x )
{
  x = as.matrix(x)

  if ( ncol( x ) == 1 )
  {
    x = t( x )
  }
  P = ncol( x )

  x_mon = x

  diff_x = t( abs( apply( x_mon, 1, diff ) ) )

  for ( j in 2 : P )
  {
    x_mon[ , j ] = x_mon[ , j - 1 ] + diff_x[ , j - 1 ]
  }
  return( x_mon )
}



test_that( ' Unfolding of univariate functional dataset',
           expect_true( all( apply( fD_unfold$values,
                                    1,
                                    function( x ) ( all( diff( x ) >= 0 ) ) )
           ) ) )

test_that( ' Unfolding of univariate functional dataset -
           consistency with Ana\'s',
           expect_equal( fD_unfold$values,
                             mon_func( fD$values ) ) )


# TESTING WARPING ---------------------------------------------------------

N = 30

t0 = 0
t1 = 1
P = 1e3 + 1

time_grid = seq( t0, t1, length.out = P )

means = round( runif( N,
               t0 + (t1 - t0) / 8,
               t1 - (t1 - t0) / 8  ), 3 )

Data = matrix( sapply( means,
                       function( m )( dnorm( time_grid, mean = m, sd = 0.05 ) ) ),
               ncol = P, nrow = N, byrow = TRUE )

fD = fData( time_grid, Data )

# Piecewise linear warpings
template_warping = function( m )( c( time_grid[ time_grid <= 0.5 ] * m / 0.5,
                                     ( time_grid[ time_grid > 0.5 ]
                                       - 0.5 ) * (1 - m ) / 0.5 + m ) )


warpings = matrix( sapply( means, template_warping ),
                   ncol = P,
                   nrow = N, byrow = T )

wfD = fData( time_grid, warpings )

fD_warped = warp( fD, wfD )

test_that( ' Warping - max',
           expect_true( all( maxima( fD_warped ) -
                               dnorm( 0.5, 0.5, 0.05 ) <= .Machine$double.eps )
                        ) )

test_that( ' Warping - which.max',
           expect_true( all( maxima( fD_warped, which = TRUE )$grid -
                               0.5 <= .Machine$double.eps )
           ) )
