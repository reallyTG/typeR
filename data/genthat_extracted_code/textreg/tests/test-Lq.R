

# simple tests for textreg package
library( testthat )
library( textreg )


context( "Lq checking" )

test_that("Lq calculating things right", {

	res = textreg( c( "A C", "A C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter=20,
			Lq=1, verbosity=0, step.verbosity=0 )
	res			
	expect_equal( res$model$Z, c(1,2,2) )
	
	# get feature C only
	res = textreg( c( "A C", "A C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter=20,
			Lq=1.5, verbosity=0, step.verbosity=0 )
	res			
	expect_equal( res$model$Z, c(1,4^{1/1.5}) )
	
	res = textreg( c( "A C", "A C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), C=1, maxIter=200,
			Lq=4, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 4^{1/4} ) )
				
	
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

	res = textreg( doc, lab, C=0.5, Lq=1, max.pattern=1, verbosity=0 )
 	res
 	
 	expect_equal( res$model$Z, c(1, 6 ) )
 	
 } )
 
 
