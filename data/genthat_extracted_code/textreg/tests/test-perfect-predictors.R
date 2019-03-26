

# simple tests for textreg package
library( testthat )
library( textreg )


context( "Checking Perfect Predictor pruning" )

test_that("Pruning perfect predictors (pt 1)", {

	m = 2
	doc = rep( c( "", "A" ), c(1000-m,m) )
	lab = rep( c( -1, 1 ),   c(990,10) )
	mu = mean( lab )
	mu
	res = textreg( doc, lab, C=1, verbosity=0  )
	res

	res = textreg( doc, lab, C=4, verbosity=0  )
	res

	res = textreg( doc, lab, C=2*(1-mu)*sqrt(m)-0.01, verbosity=0 )
	res
	expect_equal( res$model$Z, c(1,sqrt(2)) )
	
	res = textreg( doc, lab, C=2*(1-mu)*sqrt(m)+0.01, verbosity=0 )
	res
	expect_equal( res$model$Z, c(1) )

	# Lq=1
	res = textreg( doc, lab, C=2*(1-mu)+0.1, Lq=1, verbosity=0  )
	res
	expect_equal( nrow(res$model), 1 )

	res = textreg( doc, lab, C=4.01, Lq=1, verbosity=0  )
	res
	expect_equal( nrow(res$model), 1 )


	# Lq=8
	res = textreg( doc, lab, C=2*(1-mu)*(m^(1-1/8))+0.1, Lq=8, verbosity=0  )
	res
	expect_equal( nrow(res$model), 1 )

	res = textreg( doc, lab, C=2*(1-mu)*(m^(1-1/8))-0.1, Lq=8, verbosity=0  )
	res
	expect_equal( nrow(res$model), 2 )



	# res = textreg( doc, lab, C=2*(1-mu)*m-0.1, Lq=10, verbosity=0  )
	# res
	
	# res = textreg( doc, lab, C=4.01, Lq=1 , verbosity=0 )
	# res
	
	
	# res = textreg( doc, lab, C=2*(1-mu)-0.1, Lq=1, verbosity=0  )
	# res
	
	 # c( "A C", "A C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter=20,
			# Lq=1, verbosity=0, step.verbosity=0 )
	# res			
	# expect_equal( res$model$Z, c(1,2,2) )
	
	# get feature C
	res = textreg( c( "A C", "A C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter=20,
			Lq=1.5, verbosity=0, step.verbosity=0 )
	res			
	expect_equal( res$model$Z, c(1,4^{1/1.5}) )
	
	res = textreg( c( "A C", "A C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter=200,
			Lq=4, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 4^{1/4} ) )
				
} )




test_that( "more pruning perfect", {
	p = 1.5
	res = textreg( c( "A C C C", "A C C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter= 200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 2^{1/p}, sum( c(3, 2, 1, 1 )^{p} )^{1/p} ) )
	
	p = 2
	res = textreg( c( "A C C C", "A C C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter= 200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 2^{1/p}, sum( c(3, 2, 1, 1 )^{p} )^{1/p} ) )

	p = 3
	res = textreg( c( "A C C C", "A C C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter= 200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 2^{1/p}, sum( c(3, 2, 1, 1 )^{p} )^{1/p} ) )

	# pick B and C
	p = 5
	res = textreg( c( "A C C C", "A C C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter= 200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 2^{1/p}, sum( c(3, 2, 1, 1 )^{p} )^{1/p} ) )

	# now just pick A and B
	p = 1
	res = textreg( c( "A C C C", "A C C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter= 200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1,2,2) )

	# now pick A and B and C
	p = 1.1
	res = textreg( c( "A C C C", "A C C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter=200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 2^{1/p}, 2^{1/p}, sum( c(3, 2, 1, 1 )^{p} )^{1/p} ) )



	# now pick A and B and C
	p = 1.1
	res = textreg( c( "A C C C C", "A C C C", "B B C C", "B B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter=200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 2^{1/p}, (2^p + 2^p)^{1/p}, sum( c(4, 3, 2, 1 )^{p} )^{1/p} ) )



 } )
 
 
 
 test_that( "Lq=1 works", {
 	
 	# TODO: these tests are fairly weak right now
 	
  	doc = c( "", "", "A", "A", "B B B", "B A B A B" )
	lab = c( 1, 1, 1, 1, -1, -1 )

	res = textreg( doc, lab, C=0.5, Lq=1, max.pattern=1, verbosity=0 )
 	res
 
	doc2 = c( "", "", "A", "A", "B", "A B" )
	res2 = textreg( doc2, lab, C=0.5, Lq=1, max.pattern=1, verbosity=0 )
 	res2
 	
 	expect_equal( res$model$Z, c(1, 6 ) )

	expect_equal( predict(res), predict(res2) )
 
 
 	doc = c( "", "", "A", "A B", "B B", "B A B A B" )
	lab = c( 1, 1, 1, 1, -1, -1 )

	res = textreg( doc, lab, C=0.5, Lq=1, max.pattern=1, verbosity=0)
 	res
 	
 	expect_equal( res$model$Z, c(1, 6 ) )
 	
 } )
 
 
