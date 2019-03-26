

library( textreg )
library( testthat )

context( "various regressions" )

# closed form
# for r + s + t documents with
# r X ""  s X ""   t X "A"
#     -1      +1       +1
# the solution is
# mu = (s - r - z lambda/2)/(s+r)
# a = z * (1 - mu - z lambda / (2t)



test_that( "simple regression with no penalty works", {
	r = 2
	s = 4
	t = 0
	
	lab = rep( c( -1, 1 ), c( r, s+t ) )
	doc = rep( c( "", "A" ), c( r+s, t ) )
	
	res = textreg( doc, lab, C=0, maxIter=30, verbosity=0 )
	
	expect_equal( as.numeric( calc.loss( res ) ), c( 48 / 9, 48/9, 0 ) )
} )


check_combo = function( r = 1, s = 5, t = 2, lambda = 0, q = 2 ) {
	
	#cat( sprintf( "r=%d   s=%d   t=%d   lambda=%.2f   p=%0.1f\n", r, s, t, lambda, p ) )
	Z = t^{1/q}
	
	lab = rep( c( -1, 1 ), c( r, s+t ) )
	doc = rep( c( "", "A" ), c( r+s, t ) )
	
	res = textreg( doc, lab, C=lambda, maxIter=1000, Lq=q, convergence.threshold=0.0000001, verbosity=0 )
	res
	
	expect_equal( res$model$Z, c(1,Z) )
	
	mu = (s - r + Z*lambda/2) / (r+s)
	a = Z*( 1 - mu - Z * lambda / (2*t) )
	mu
	a

	res$model$beta - c(mu,a)
		
	expect_equal( res$model$beta, c(mu, a), tolerance=0.00001 )
	
	# prediction engine working?
	pds = predict( res )
	expect_equal( pds, rep( c(mu, mu+a/Z), c(r+s,t) ), tolerance=0.00001 )
	
}

test_that( "Variety of combos correspond to closed form (no lambda)", {
	# no penalty, L2 scaling
	check_combo( 1, 1, 1, 0, 2 )
	
	check_combo( 1, 2, 3, 0, 2 )
	
	check_combo( 10, 2, 3, 0, 2 )
	
	check_combo( 10, 2, 100, 0, 2 )
	
	
	
	# no penalty, L3 scaling
	check_combo( 1, 1, 1, 0, 3 )
	
	check_combo( 1, 2, 3, 0, 3 )
	
	#check_combo( 10, 2, 3, 0, 3 )
	
	#check_combo( 10, 2, 100, 0, 2 )
	
	# no penalty, L1.5 scaling
	check_combo( 1, 1, 1, 0, 1.5 )
	
	check_combo( 1, 2, 3, 0, 1.5 )

} )




test_that( "Variety of combos correspond to closed form (lambda=1.5)", {
	# penalty, L2 scaling
	check_combo( 1, 1, 1, 0.5, 2 )
	
	check_combo( 1, 2, 3, 0.5, 2 )
	
	check_combo( 10, 2, 3, 0.5, 2 )
	
	check_combo( 10, 2, 100, 0.5, 2 )
	
	
	
	# penalty, L3 scaling
	check_combo( 1, 1, 1, 0.5, 3 )
	
	check_combo( 1, 2, 3, 0.5, 3 )
	
	check_combo( 10, 2, 3, 0.5, 3 )
	
	check_combo( 100, 100, 100, 5, 3 )
	
	check_combo( 10, 2, 3, 0.5, 3 )
	
	check_combo( 10, 2, 100, 0, 3 )
	
	# penalty, L1.5 scaling
	check_combo( 1, 1, 1, 0.5, 1.5 )
	
	check_combo( 1, 2, 3, 0.5, 1.5 )



	# penalty, L1 scaling
	check_combo( 1, 1, 1, 0.5, 1 )
	
	check_combo( 1, 2, 3, 0.5, 1 )
	
	check_combo( 10, 2, 3, 0.5, 1 )
	
	check_combo( 10, 2, 100, 0, 1 )

} )







