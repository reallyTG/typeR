

# simple tests for textreg package
library( testthat )
library( textreg )


context( "finding intercept call" )

test_that("find intercept works", {
	data( testCorpora )
	testI = testCorpora$testI
		
	res = find.threshold.C( testI$corpus, testI$labelI, c("frog","goat","bat"), verbosity=0 )	
	expect_equal( res, 4.94873986 )

	# look at 1 random scramblings of labeling
	res2 = find.threshold.C( testI$corpus, testI$labelI, c("frog","goat","bat"), R=1, verbosity=0 )	
	expect_true( res2[2] <= res )
	
	# look at 10 random scramblings of labeling
	res = find.threshold.C( testI$corpus, testI$labelI, c("frog","goat","bat"), R=10, verbosity=0 )	

	# get 10 thresholds back, plus original
	expect_equal( length(res), 11 )
	expect_equal( res[1], 4.94873986 )
} )



test_that("no C needed gives 0", {
	
	corpus = rep( "cat dog pig goat", 14 )
		
	res = find.threshold.C( corpus, rep( c(-1,1), c(4,10) ), c(), verbosity=0 )
	expect_equal( res, 0, tolerance=0.0001 )
	
	res = find.threshold.C( corpus, rep( c(-1,1), c(7, 7) ), c(), verbosity=0 )
	expect_equal( res, 0, tolerance=0.0001 )
	
	res = find.threshold.C( c( "A", "B" ), c( 1, 1 ), c(), verbosity=0 )
	expect_equal( res, 0, tolerance=0.0001 )

	res = find.threshold.C( corpus, rep( c(-1,1), c(7, 7) ), c(), R=50, verbosity=0 )
	expect_equal( res, rep(0,51), tolerance=0.0001 )

} )


test_that( "Get right Cs that we expect", {
	res = find.threshold.C( paste( "S", 1:10, sep="" ), rep( c(1,-1), c(1,9) ), c(), R=50, verbosity=0 )
	expect_equal( res, rep(3.6,51), tolerance=0.001 )

	# checking C works
	res = textreg( paste( "S", 1:10, sep="" ), rep( c(1,-1), c(1,9) ), c(), maxIter = 1, C=3.601, verbosity=0 )
	expect_equal( nrow(res$model), 1 )
	
	res = textreg( paste( "S", 1:10, sep="" ), rep( c(1,-1), c(1,9) ), c(), maxIter = 1, C=3.59, verbosity=0 )
	expect_equal( nrow(res$model), 2 )
	
	corpus = rep(c("cat", "dog"), c(9,4) )
	lab = rep( c(1,-1), c(11,2) )
	
	res = textreg( corpus, lab, c(), maxIter=1, C=1000, verbosity=0 )
	expect_equal( res$model$beta[[1]], 9/13, tolerance=0.0001 )
	
	res1 = find.threshold.C( corpus, lab, verbosity=0)
	expect_equal( res1, 2*18/13, tolerance=0.0001 )
	
	res2 = find.threshold.C( corpus, rev(lab), verbosity=0 )
	expect_equal( res2, 16/13, tolerance=0.0001 )

	
	res3 = find.threshold.C( corpus, rep( c(1,-1,1), c(1,11,1) ), c(), verbosity=0 )
	expect_equal( res3, 10/13, tolerance=0.0001 )

	
	res = find.threshold.C( corpus, rep( c(1,-1,1), c(1,11,1) ), c(), verbosity=0, R=200)
	unq = sort( unique( res ) )
	expect_equal( unq, c(10/13, 16/13, 2*18/13 ), tolerance=0.0001 )

} )
