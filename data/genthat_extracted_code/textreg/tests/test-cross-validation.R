

# simple tests for textreg package
library( testthat )
library( textreg )


context( "test cross validation" )

test_that("components of cross validation at least run", {

	data( bathtub )
	mth.lab = meta(bathtub)$meth.chl
	mth.lab[ 90:100 ] = 1

	smp = sample( length(bathtub), length(bathtub)*0.5 )
	rs = textreg( bathtub[smp], mth.lab[smp], c("methylene","chloride"), 
				C = 3, gap=1, 
				min.support = 5, verbosity=0, convergence.threshold=0.00001, 
				maxIter=100 )
	rs
	train.pred = predict( rs )
	test.pred = predict( rs, bathtub[-smp] )

	train.loss = calc.loss( rs )
	train.loss
	test.loss = calc.loss( rs, bathtub[-smp], mth.lab[-smp] )
	test.loss
	
	expect_equal( train.loss[[3]], test.loss[[3]] )
	
	fake.pred = predict( rs, bathtub[smp] )
	expect_equal( fake.pred, train.pred )
	
	fake.loss = calc.loss( rs, bathtub[smp], mth.lab[smp] )
	expect_equal( fake.loss, train.loss )
	
	#	expect_true( train.loss[[2]] <= test.loss[[2]] )
} )



test_that("cross validatation function works", {

	data( bathtub )
	mth.lab = meta(bathtub)$meth.chl
	mth.lab[ 90:100 ] = 1
	table( mth.lab )
	
	tbl = find.CV.C( bathtub, mth.lab, c("methylene","chloride"), 4, 10, verbosity=0 )
	tbl
	expect_equal( nrow( tbl ), 10 )
	expect_equal( ncol( tbl ), 4 )

	# does it plot without crashing?
	rs = make.CV.chart( tbl )
	expect_equal( length(rs), 4 )
} )


test_that("passing maxIter through cross-validatation function works", {
    
    data( bathtub )
    mth.lab = meta(bathtub)$meth.chl
    mth.lab[ 90:100 ] = 1
    table( mth.lab )
    
    tbl = find.CV.C( bathtub, mth.lab, c("methylene","chloride"), 4, 10, maxIter=3, verbosity=0 )
    tbl
    expect_equal( nrow( tbl ), 10 )
    expect_equal( ncol( tbl ), 4 )
    
    # does it plot without crashing?
    rs = make.CV.chart( tbl )
    expect_equal( length(rs), 4 )
} )
