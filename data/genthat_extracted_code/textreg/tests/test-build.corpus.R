

# simple tests for textreg package
library( testthat )
library( textreg )

context( "build.corpus and re-calling textreg" )

test_that("we can build a corpus", {
	data( testCorpora )
	testI = testCorpora$testI
	
	corpus = build.corpus( testI$corpus, testI$labelI, verbosity=0 )
	
	expect_equal( is.textreg.corpus( corpus ), TRUE )
} )

test_that( "stability test 1", {
	
	# This tests that we get the same answer with a series of 
	# calls---used to break, but bug was fixed.  Legacy test.
	m = 2
	doc = rep( c( "", "A" ), c(1000-m,m) )
	lab = rep( c( -1, 1 ),   c(990,10) )
	mu = mean( lab )

	crp = build.corpus( doc, lab, verbosity=0 )
	res = textreg( crp, C=2*(1-mu)*sqrt(m)+0.01, verbosity=0 )
#	print( res )


	# Lq=1
	crp2 = build.corpus( doc, lab, verbosity=0 )
	res2 = textreg( crp2, C=2*(1-mu)+0.1, Lq=1, verbosity=0  )
#	print(	res2 )
	
	crp3 = build.corpus( doc, lab, verbosity=0 )
	res3 = textreg( crp3, C=2*(1-mu)+0.1, Lq=1, verbosity=0  )
#	print(	res3 )
	
	expect_equal( res2, res3 )
} )



test_that( "stability test 2", {
	
	# do we get same answer on subsequent calls?
	m = 2
	doc = rep( c( "", "A" ), c(1000-m,m) )
	lab = rep( c( -1, 1 ),   c(990,10) )
	mu = mean( lab )

	crp = build.corpus( doc, lab, verbosity=0 )
	res = textreg( crp, C=2*(1-mu)*sqrt(m)+0.01, verbosity=0 )
	
	res2 = textreg( crp, C=2*(1-mu)*sqrt(m)+0.01, verbosity=0 )

	expect_equal( res, res2 )
	
	crp2 = build.corpus( doc, lab, verbosity=0 )
	res2 = textreg( crp2, C=2*(1-mu)+0.1, Lq=1, verbosity=0  )
	
	res3 = textreg( crp2, C=2*(1-mu)+0.1, Lq=1, verbosity=0  )
	expect_equal( res2, res3 )
} )



test_that( "stability test 3: Get right things from Lq", {
	
	corp = build.corpus( c( "A C", "A C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), verbosity=0 )
	
	res = textreg( corp, C=1, maxIter=20,
			Lq=1, verbosity=0, step.verbosity=0 )
	res			
	expect_equal( res$model$Z, c(1,2,2) )
	
	# get feature C only
	res = textreg( corp, C=1, maxIter=20,
			Lq=1.5, verbosity=0, step.verbosity=0 )
	res			
	expect_equal( res$model$Z, c(1,4^{1/1.5}) )
	
	res = textreg( corp, C=1, maxIter=200,
			Lq=4, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 4^{1/4} ) )
				
	
	p = 1.5
	corp2 = build.corpus( c( "A C C C", "A C C", "B C", "B C", "", "", "", "","","" ), c(1,1,1,1,-1,-1,-1,-1,-1,-1), verbosity=0 )
	
	res = textreg( corp2, C=1, maxIter= 200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 2^{1/p}, sum( c(3, 2, 1, 1 )^{p} )^{1/p} ) )
	
	p = 2
	res = textreg( corp2, C=1, maxIter= 200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 2^{1/p}, sum( c(3, 2, 1, 1 )^{p} )^{1/p} ) )

	p = 3
	res = textreg( corp2, C=1, maxIter= 200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 2^{1/p}, sum( c(3, 2, 1, 1 )^{p} )^{1/p} ) )

	# pick B and C
	p = 5
	res = textreg( corp2, C=1, maxIter= 200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 2^{1/p}, sum( c(3, 2, 1, 1 )^{p} )^{1/p} ) )

	# now just pick A and B
	p = 1
	res = textreg( corp2, C=1, maxIter= 200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1,2,2) )

	# now pick A and B and C
	p = 1.1
	res = textreg( corp2, C=1, maxIter=200,
			Lq=p, verbosity=0, step.verbosity=0 )
	expect_equal( res$model$Z, c(1, 2^{1/p}, 2^{1/p}, sum( c(3, 2, 1, 1 )^{p} )^{1/p} ) )

 

} )



# test_that( "ban word list updating works", {

	# corp = build.corpus( c( "A frog goat dog bear", "The frog goat dog cat", "Small frog or big goat dog cows", "Pickle frog goat under tiny dog licks"	), c( 1, 1, -1, -1 ), c(), verbosity=0 )
	
	# rs = textreg( corp, g=1, C=2, verbosity=0 )
	# rs
	
	# expect_equal( rs$model$ngram, c("*intercept*", "frog * dog" ) )

	# rs = textreg( corp, banned=c("goat"), g=1, C=2, verbosity=0 )
	# rs
	# expect_equal( rs$model$ngram, c("*intercept*" ) )
	
	# rs = textreg( corp, banned=c("goat","A","The"), g=1, C=1, verbosity=0 )
	# rs
	# expect_equal( rs$model$ngram, c("*intercept*", "Pickle", "Small" ) )
# } )
	


