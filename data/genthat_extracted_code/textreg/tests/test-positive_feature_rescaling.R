

# simple tests for textreg package
library( testthat )
library( textreg )


context( "rescaling positive documents" )

test_that("positive document rescaling works", {
	
	
	
	res = textreg( c( "A", "A", "A", "A" ), c(1,1,-1,-1), c(), C=0, verbosity=0 )	
	res = res$model
	res
	expect_equal( res$ngram[[1]], "*intercept*" )
	expect_equal( nrow(res), 1 )

	res = textreg( c( "A", "A", "A" ), c(1,-1,-1), c(), C=0, verbosity=0, positive.weight=2 )	
	res
	res = res$model
	expect_equal( res$ngram[[1]], "*intercept*" )
	expect_equal( nrow(res), 1 )

	res = textreg( c( "A", "A", "A" ), c(1,-1,-1), c(), C=0.5, verbosity=0, positive.weight=1 )	
	res
	res = res$model
	expect_equal( res$ngram[[1]], "*intercept*" )
	expect_equal( res$beta[[1]], -1/3, tolerance=0.0001 )


	res = textreg( c( "A", "A", "" ), c(1,-1,-1), c(), C=0, verbosity=0, positive.weight=1 )	
	res
	res = res$model
	expect_equal( res$ngram[[1]], "*intercept*" )
	expect_equal( res$beta[[1]], -1, tolerance=0.0001 )
	expect_equal( res$beta[[2]], sqrt(2), tolerance=0.0001 )


#	res = textreg( c( "A", "A", "", "", "", "", "", "" ), c(1,-1,-1,-1,-1,-1,-1,-1,-1), c(), C=0, verbosity=0, positive.weight=2 )	
#	res
#	res = res$model
#	expect_equal( res$ngram[[1]], "*intercept*" )
#	expect_equal( res$beta[[1]], -1, tolerance=0.0001 )
#	expect_equal( res$beta[[2]], sqrt(2), tolerance=0.0001 )


	res = textreg( c( "A", "C", "C", "B", "B","B" ), c(1,-1,-1,-1,-1,-1), c(), C=0.1, verbosity=0, positive.weight=1 )	
	res
#	res = res$model
#	expect_equal( res$ngram[[1]], "*intercept*" )
#	expect_equal( res$beta[[1]], -1/3, tolerance=0.0001 )

} )


