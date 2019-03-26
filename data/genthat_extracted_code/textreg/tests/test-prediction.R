
##
## test the prediction stuff
##

# simple tests for textreg package
library( testthat )
library( textreg )

context( "Testing Prediction" )



test_that( "calc loss works", {
	data( testCorpora )
	
	res = textreg( c( "", "", "A", "A" ), c( -1, -1, 1, 1 ), C=1, Lq=1, convergence.threshold=0.00000001, verbosity=0 )
	res
	expect_equal( as.numeric( calc.loss( res ) ), c(3, 1, 2) )

	predict( res, new.text=c("A B C"), new.labeling=c(1) )

	expect_equal( as.numeric( calc.loss( res, new.text=c("A B C"), new.labeling=c(1) ) ), c( 2.25, 0.25, 2.0) )
} )



test_that( "prediction on original data works", {
	data( testCorpora )
	
	res = textreg( c( "", "", "A", "A" ), c( -1, -1, 1, 1 ), C=1, Lq=1, convergence.threshold=0.00000001, verbosity=0 )
	res
	pds = predict( res )
	pds
	expect_equal( pds, c( -0.5, -0.5, 0.5, 0.5 ), tolerance=0.00001 )
	expect_equal( as.numeric( calc.loss( res ) ), c(3,1,2 ) )
	
	res = textreg( rep( "", 6 ), c( -1, -1, 1, 1, 1, 1 ), C=1, Lq=1, convergence.threshold=0.00000001, verbosity=0 )
	res
	pds = predict( res )
	pds
	expect_equal( pds, rep( 1/3, 6 ), tolerance=0.00001 )
	
	expect_equal( calc.loss( res )[[1]], 48/9 )
} )



test_that( "make phrase matrix works", {
	data( bathtub )
	mat = make.phrase.matrix( c( "a", "and", "bathtub", "falling", "asdfac", "stripper" ), bathtub )
	expect_equal( dim( mat ), c( length(bathtub), 6 ) )
	expect_equal( as.numeric(mat[2,]), c(5,2,1,1,0,0) )
} )



test_that( "Different ways of making phrase matrices work", {

	data( bathtub )
	
	# get labeling
	lab = meta( bathtub )$meth.chl
	head( lab )
	
	res = textreg( bathtub, lab, C=2, verbosity=0 )
	keyphrase.mat = make.phrase.matrix( res$model$ngram, bathtub )
	keyphrase.mat[, "*intercept*"] = 1

	k2 = phrase.matrix( res$rules, res$notes$n )
	expect_equal( dim( k2 ), dim( keyphrase.mat ) )
	expect_true( all( k2 == keyphrase.mat ) )

} )


test_that( "phrase.matrix works on empty models", {

	data( bathtub )
	
	# get labeling
	lab = meta( bathtub )$meth.chl
	head( lab )
	
	res = textreg( bathtub, lab, C=20, verbosity=0 )
	res
	
	pm = phrase.matrix( res )
	expect_equal( class(pm), "matrix" )
	expect_equal( ncol(pm), 1 )
	
	pm2 = make.phrase.matrix( c("*intercept*"), bathtub )
	pm2
	expect_equal( nrow(pm), nrow(pm2) )
	expect_equal( ncol(pm2), 1 )
	
} )


test_that( "make.phrase.matrix works on empty models", {

	data( bathtub )
	
	
	pm = make.phrase.matrix( c("bathtub","dog"), bathtub )
	head(pm)
	
	pm2 = make.phrase.matrix( c("bathtub","dog"), bathtub[6] )
	pm2
	expect_equal( nrow(pm2), 1 )
	expect_equal( ncol(pm2), 2 )
	expect_equal( pm[6,], pm2[1,] )
	
} )



test_that( "Both prediction paths work", {
	data( bathtub )
	
	# get labeling
	lab = meta( bathtub )$meth.chl
	head( lab )
	
	res = textreg( bathtub, lab, C=2, verbosity=0 )
	
	pds = predict( res )

	pds.rev = predict( res, rev( bathtub ) )
	
	expect_equal( pds, rev(pds.rev) )
	
} )


test_that( "Prediction works for a single document", {
	data( bathtub )
	
	# get labeling
	lab = meta( bathtub )$meth.chl
	head( lab )
	
	res = textreg( bathtub, lab, c("methylene","chloride"), C=2, verbosity=0 )
	
	pds = predict( res, bathtub[1] )

	pdsall = predict( res )
	
	expect_equal( pds, pdsall[[1]] )	
} )


test_that( "Both prediction paths work for a null model", {
	data( bathtub )
	
	# get labeling
	lab = meta( bathtub )$meth.chl
	head( lab )
	
	res = textreg( bathtub, lab, C=20, verbosity=0 )
	
	pds = predict( res )

	pds.rev = predict( res, rev( bathtub ) )
	
	expect_equal( pds, rev(pds.rev) )
	
	keyphrase.mat = make.phrase.matrix( res$model$ngram, bathtub )
	expect_equal( dim( keyphrase.mat ), c(127, 1) )
	
} )



test_that( "predict.textreg.result getting matrix works", {
	data( bathtub )
	lab = meta( bathtub )$meth.chl
	res = textreg( bathtub, lab, C=4, verbosity=0 )
	
	new.text=c( "a bathtub stripper is a world of hurt", "little dogs")
	
	pds = predict( res, new.text, return.matrix=TRUE )

	expect_equal( as.numeric(pds), c( 1.58635618/5.385165 + -0.85016147, -0.8501615 ), tolerance=0.00001 )
	
	mt = attr( pds, "keyphrase.mat" )
	expect_equal( dim(mt), c(2,10) )
	
	expect_equal( sum(mt), 3 )
	expect_equal( mt[,1], c(1,1) )
	
	new.text = VCorpus( VectorSource( new.text ) )
	pds2 = predict( res, new.text, return.matrix=TRUE )
	expect_true( all( pds == pds2 ) )
	expect_true( all( attr( pds, "keyphrase.matrix" ) == attr( pds2, "keyphrase.matrix" ) ) )
} )


