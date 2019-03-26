

# simple tests for textreg package
library( testthat )
library( textreg )


context( "test no regularization" )

test_that("no.regularization works (intercept)", {
	data( testCorpora )
	testI = testCorpora$testI
	
	res = textreg( testI$corpus, testI$labelI, c("frog","goat","bat"), C=100, no.regularization=TRUE, verbosity=0 )	
	res = res$model
	expect_equal( res$ngram[[1]], "*intercept*" )
	expect_equal( res$support, 14 )
	expect_equal( res$totalDocs, 14 )
	expect_equal( res$totalDocs, 14 )
	expect_equal( res$posCount, 4 )
	expect_equal( res$negCount, 10 )
	expect_equal( res$beta, -12/28, tolerance=0.0001 )
	expect_equal( res$Z, 1 )
} )

test_that( "no regularization zero intercept included", {
	testIII = rep( "frog", 100 )
	res = textreg( testIII, rep( c(1,-1), 50 ), c(), no.regularization=TRUE, verbosity = 0 )
	res = res$model
    expect_equal( res$beta[[1]], 0, tolerance=0.00001 )
	expect_equal( res$Z[[1]], 1 )	
	expect_output( print( res ), "*intercept*" )
} )



test_that( "no regularization", {
	data( testCorpora )
	test = testCorpora$testI
	test
	
	res = textreg( test$corpus, test$labelI, c(), C=0.5, a=1, maxIter=2145, verbosity=0, no.regularization=TRUE )
	res
	expect_equal( res$model$Z, c(1,1,1 ) )
	expect_equal( res$model$totalDocs, c(14,4,6) )
	
	
    lab = c(1,1,1,-1,-1)
	res = textreg( c( "A", "C A A", "A B A", "A A B A A C", "A A B A C A C A" ), lab, c(), no.regularization=TRUE, C=0, verbosity=0 )
	res
    expect_true( all( predict( res ) * lab  >= 0.99 ) )
	expect_equal( as.numeric( calc.loss( res ) ), c(0,0,0), tolerance=0.001 )
	expect_equal( res$model$Z, c( 1, 1 ), tolerance=0.00001 )
	expect_equal( res$model$totalDocs, c(5, 5 ) )
	expect_equal( res$model$support, c(5, 14) )

} )
