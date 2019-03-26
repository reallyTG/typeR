

# simple tests for textreg package
library( testthat )
library( textreg )

#library( corrplot )

context( "vizualtion methods" )

test_that("vizualization methods call (bad tests)", {

	data( testCorpora )
	testI = testCorpora$testI
	
	res = textreg( testI$corpus, testI$labelI, c("frog","bat"), C=0.1, verbosity=0, positive.only=TRUE )	
	res
	mat = make.appearance.matrix( res )
	mat
	expect_equal( ncol( mat ), 5 )
	expect_equal( nrow( mat ), length(testI) )
	
	smat = make.similarity.matrix( res )
	smat2 = make.similarity.matrix( mat )
	expect_equal( smat, smat2 )
	
	clust = cluster.phrases( res, plot=FALSE, num.groups=2 )
	expect_true( !is.null( clust$mat ) )
	
	expect_equal( ncol(clust$mat), ncol(clust$sim.mat) )
	expect_equal( nrow(clust$sim.mat), ncol(clust$sim.mat) )
	
	make.phrase.correlation.chart( res, count=FALSE, num.groups=2 )
	make.phrase.correlation.chart( res, count=TRUE, num.groups=2 )

	make.phrase.correlation.chart( res, count=TRUE, num.groups=2, use.corrplot=TRUE )

	clust = cluster.phrases( res, plot=FALSE, num.groups=2 )
	
} )



test_that("comparing summary chart", {

	data( testCorpora )
	testI = testCorpora$testI
	
	res = textreg( testI$corpus, testI$labelI, c("frog","bat"), C=0.1, verbosity=0, positive.only=TRUE )	
	res
	mat = make.appearance.matrix( res )
	mat
	expect_equal( ncol( mat ), 5 )
	expect_equal( nrow( mat ), length(testI) )
	
	smat = make.similarity.matrix( res )
	smat2 = make.similarity.matrix( mat )
	expect_equal( smat, smat2 )
	
	clust = cluster.phrases( res, plot=FALSE, num.groups=2 )
	expect_true( !is.null( clust$mat ) )
	
	expect_equal( ncol(clust$mat), ncol(clust$sim.mat) )
	expect_equal( nrow(clust$sim.mat), ncol(clust$sim.mat) )
	
	make.phrase.correlation.chart( res, count=FALSE, num.groups=2 )
	make.phrase.correlation.chart( res, count=TRUE, num.groups=2 )

	make.phrase.correlation.chart( res, count=TRUE, num.groups=2, use.corrplot=TRUE )

	clust = cluster.phrases( res, plot=FALSE, num.groups=2 )
	
} )
