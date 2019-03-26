

# simple tests for textreg package
library( testthat )
library( textreg )

context( "textreg call" )

test_that("program runs and gives right number of documents back", {
	data( testCorpora )
	testI = testCorpora$testI
	testI
		
	res = textreg( testI$corpus, testI$labelI, c("frog","goat","bat"), C=100, verbosity=0 )	
	res = res$model
	res
	expect_equal( res$ngram[[1]], "*intercept*" )
	expect_equal( res$support, 14 )
	expect_equal( res$totalDocs, 14 )
	expect_equal( res$totalDocs, 14 )
	expect_equal( res$posCount, 4 )
	expect_equal( res$negCount, 10 )
	#expect_equal( res$negWordCount, 10 )
	#expect_equal( res$posWordCount, 4 )
	expect_equal( res$beta, -12/28 )
	expect_equal( res$Z, 1 )
} )

test_that( "zero intercept included", {
	testIII = rep( "frog", 100 )
	res = textreg( testIII, rep( c(1,-1), 50 ), c(), verbosity = 0 )
	res = res$model
	expect_equal( res$beta[[1]], 0 )
	expect_output( print( res ), "*intercept*" )
} )

test_that( "all positive frogs", {
	testIII = rep( "frog", 100 )
	res = textreg( testIII, rep( c(1), 100 ), c(), verbosity = 0 )
	res = res$model
	#expect_equal( nrow(res), 1 )
	expect_true( res$beta[[1]] >= 1.0  )  # intercept should be at least 1
} )


test_that( "negative betas", {
	data( testCorpora )
	testII = testCorpora$testII
	res = textreg( testII$corpus, testII$labelI, c(), C=1.5, a=1, maxIter=2145, verbosity=0 )
	res = res$model
	
	dnky = res[ 2, ]
	expect_output( print( dnky ), "donkey" )
	expect_true( dnky$beta[[1]] < 0 )
	expect_equal( dnky$Z[[1]],  sqrt(8) )
	
	#betas = round( betas, digits=3 )
	expect_equal( round( res$beta, digits=3 ), c( 0.166, -2.569, 0.157, 0.125, 0 ) )

	# now force out negative predictor
	res2 = textreg( testII$corpus, testII$labelI, c(), positive.only=1, C=1.5, a=1, maxIter=2145, verbosity=0 )
	res2 = res2$model
	expect_equal( nrow(res2), 4 )
	expect_equal( res2$beta > 0, c( FALSE, TRUE, TRUE, TRUE) )
	expect_equal( res2$ngram[-1], c("frog", "goat", "goat goat" ) )
#	expect_equal( res2$posWordCount, c(3,4,3,1) )
	expect_equal( res2$posCount, c(3,2,2,1) )
	expect_equal( res2$support, c(11,5,4,1) )
	expect_equal( res2$Z, c( 1, sqrt(11), sqrt(1+2^2+1), 1 ) )

	# No regularization
	res2 = textreg( testII$corpus, testII$labelI, c(), positive.only=1, C=0, a=1, maxIter=2145, verbosity=0 )
	expect_equal( res2$model$beta > 0, c( FALSE, TRUE, TRUE, TRUE, TRUE) )
	
	expect_equal( round( predict(res2) ) * testII$labelI, c(0,1,1,1,1,0,1,1,1,1,1) )
	expect_equal( as.numeric( calc.loss( res2 ) ), c( 2, 2, 0 ) )
} )

test_that( "proper textregs found", {
	corpus = c( "A A A A B A", "A B A A B", "A B A", "B A", "B" )
	labeling = c( 1, 1, 1, 1, -1 )
	
	rs = textreg( corpus, labeling, c(), min.pattern=2, C=0, maxIter=1, verbosity=0)
	expect_equal( nrow(rs$model), 2 )
	expect_equal( rs$model$posCount, c(4,4) )
	#expect_equal( rs$model$posWordCount, c(4,4) )
	#expect_equal( rs$model$negWordCount, c(1,0) )
	rm = phrase.matrix( rs$rules, length(corpus) )
	expect_equal( rs$model$ngram, c( "*intercept*", "B A" ) )
	expect_equal( rm[,"B A"], c(1,1,1,1,0) )
	
	
	rs2 = textreg( corpus, labeling, c(), min.pattern=2, C=0, maxIter=1000, verbosity=0)
	expect_equal( round( rs2$model$beta, digits=3 ), c( -1, 4 ) )
	
	corpus = c( "A A A A B A", "A B A A B", "A C A", "B A C B", "A B" )
	labeling = c( 1, 1, 1, -1, -1 )
	
	rs = textreg( corpus, labeling, c(), min.pattern=2, gap=1, C=0, maxIter=1, verbosity=0)
	rs
	expect_equal( nrow(rs$model), 2 )
	expect_equal( rs$model$posCount, c(3,3) )
#	expect_equal( rs$model$posWordCount, c(3,5) )
	expect_equal( rs$model$ngram, c( "*intercept*", "A * A" ) )
	#expect_equal( rs$model$negWordCount, c(2,0) )
	rm = phrase.matrix( rs$rules, length(corpus) )
	expect_equal( rm[,"A * A"], c(3,1,1,0,0) )
} )



test_that( "simple prediction works", {
	corpus = c( "A A A A B A", "A B A A B", "A B A", "B A", "B" )
	labeling = c( 1, 1, 1, 1, -1 )
	rs = textreg( corpus, labeling, c(), min.pattern=2, C=0, maxIter=1000, verbosity=0)

	rm = phrase.matrix( rs$rules, length(corpus) )
	
	pd = predict( rs )
	expect_equal( round( pd, digits=3 ), c( 1, 1, 1, 1, -1 ) )

	# force to only intercept
	rs2 = textreg( corpus, labeling, c(), min.pattern=2, C=10, maxIter=1000, verbosity=0)

	rm2 = phrase.matrix( rs2$rules, length(corpus) )
	
	pd2 = predict( rs2 )
	expect_equal( pd2, c( 0.6, 0.6, 0.6, 0.6, 0.6 ) )

	# shrink some
	rs2 = textreg( corpus, labeling, c(), min.pattern=2, C=1, maxIter=1000, verbosity=0)

	rm2 = phrase.matrix( rs2$rules, length(corpus) )
	
	expect_equal( rm2, rm )
	
	pd2 = predict( rs2 )
	expect_equal( round( pd2, digits=3 ), c( 0.75, 0.75, 0.75, 0.75, 0 ) )


} )



test_that( "calc loss", {
	corpus = c( "A A A A B A", "A B A A B", "A B A", "B A", "B" )
	labeling = c( 1, 1, 1, 1, -1 )
	rs = textreg( corpus, labeling, c(), min.pattern=2, C=0, maxIter=1000, verbosity=0)
	
	expect_equal( rs$notes$C, 0 )
	
	expect_equal( as.numeric(calc.loss( rs ) ), c( 0, 0, 0 ), tolerance=0.001 )

	rs = textreg( corpus, labeling, c(), min.pattern=2, C=1, maxIter=1000, verbosity=0)
	
	# now with shrinkage	
	expect_equal( rs$notes$C, 1 )
	rs$model
	expect_equal( rs$model$beta, c( 0, 1.5 ), tolerance=0.001 )
	expect_equal( as.numeric( calc.loss( rs ) ), c( 2.75, 1.25, 1.5 ), tolerance=0.001 )
} )


test_that( "gap check", {
	data( testCorpora )
	testIII = testCorpora$testIII
	
	res = textreg( testIII$corpus, testIII$labelI, c(), C=3.0, a=1, gap=1, maxIter=2145, verbosity=0 )
	res$model
	
	expect_equal( res$model$ngram, c( "*intercept*", "dog * pig" ) )
	
	# no gap then no dice
	res = textreg( testIII$corpus, testIII$labelI, c(), C=3, a=1, gap=0, maxIter=2145, verbosity=0 )
	res$model
	expect_equal( res$model$ngram, c( "*intercept*" ) )


	# double skip, but only 1 gap allowed.  No dice.
	testIV = testCorpora$testIV
	res = textreg( testIV$corpus, testIV$labelI, c(), C=3, a=1, gap=1, maxIter=2145, verbosity=0 )
	expect_equal( res$model$ngram, c("*intercept*") )
	
	res = textreg( testIV$corpus, testIV$labelI, c(), C=3, a=1, gap=2, maxIter=2145, verbosity=0 )
	expect_equal( res$model$ngram, c("*intercept*", "dog * * pig") )
} )



test_that( "file system call", {
	expect_error( textreg( "fakefilename.txt", c( 1, 1, -1 ), c(), C=3.0, a=1, gap=1, maxIter=2145, verbosity=0 ) )

} )


test_that( "ban word lists work", {

	rs = textreg( c( "frog goat", "goat frog", "goat", "goat"	), c( 1, 1, -1, -1 ), c(), C=1, verbosity=0 )
	expect_equal( rs$model$ngram, c("*intercept*","frog" ) )
	
	rs = textreg( c( "frog goat", "goat frog", "goat", "goat"	), c( 1, 1, -1, -1 ), c("frog"), C=1, verbosity=0 )
	expect_equal( rs$model$ngram, c("*intercept*" ) )
    expect_equal( rs$banlist, c("frog" ) )
    
	rs = textreg( c( "A frog goat dog bear", "The frog goat dog cat", "Small frog or big goat dog cows", "Pickle frog goat under tiny dog licks"	), c( 1, 1, -1, -1 ), c(), g=1, C=2, verbosity=0 )
	rs
	
	expect_equal( rs$model$ngram, c("*intercept*", "frog * dog" ) )

	rs = textreg( c( "A frog goat dog bear", "The frog goat dog cat", "Small frog or big goat dog cows", "Pickle frog goat under tiny dog licks"	), c( 1, 1, -1, -1 ), c("goat"), g=1, C=2, verbosity=0 )
	rs
	expect_equal( rs$model$ngram, c("*intercept*" ) )
	
	rs = textreg( c( "A frog goat dog bear", "The frog goat dog cat", "Small frog or big goat dog cows", "Pickle frog goat under tiny dog licks"	), c( 1, 1, -1, -1 ), c("goat","A","The"), g=1, C=1, verbosity=0 )
	rs
	expect_equal( rs$model$ngram, c("*intercept*", "Pickle", "Small" ) )
} )




test_that( "reformat phrase works", {

	rs = textreg( c( "frog goat", "goat frog", "goat", "goat"	), c( 1, 1, -1, -1 ), c(), C=1, verbosity=0 )
	rs
	md = reformat.textreg.model(rs)
	expect_equal( nrow( md ), 2 )
} )

