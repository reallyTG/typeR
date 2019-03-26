

# simple tests for textreg package
library( testthat )
library( textreg )

context( "path.matrix testing" )

test_that("get path matrix", {
	data( testCorpora )
	testI = testCorpora$testI

	res = textreg( testI$corpus, testI$labelI, c("frog","goat","bat"), C=100, verbosity=0 )	
	pm = make.path.matrix( res )
	expect_equal( dim(pm), c(3, 1) )

		
	res = textreg( testI$corpus, testI$labelI, c("frog","goat","bat"), C=1, verbosity=0 )	
	pm = make.path.matrix( res )
	expect_equal( dim(pm), c(41, 4) )
	expect_equal( sort(attr(pm,"features")), sort(res$model$ngram) )


	path.matrix.chart( pm )
	
	plot( res )
} )
