

# simple tests for textreg package
library( testthat )
library( textreg )
library( tm )

context( "making word lists and displays of word lists" )


test_that( "little list tables", {
  
        df1 = data.frame( word=c("*intercept*","wordie", "wordieSmall", "wordieBig"),
                          weight=c(1, 2, 0.5, 2.5) )
        df2 = data.frame( word=c("*intercept*", "piggie"), 
                          weight=c(1,2) )
        tbl = make.list.table( list( A= df1, B=df1, C=df2 ) )
        expect_equal( class( tbl ), "matrix" )
        expect_equal( as.numeric( tbl[,1] ), c(4,3,1, NA) )
        expect_equal( as.numeric( tbl[,3] ), c(NA, NA, NA, 2) )
        expect_equal( rownames(tbl), c("wordieBig", "wordie", "wordieSmall","piggie"))
        
        
        df1 = data.frame( word=c("*intercept*","wordie", "wordie2"), weight=c(1,2,3) )
        df2 = data.frame( word=c("*intercept*"), weight=c(1) )
        
        tbl = make.list.table( list( A= df1, B=df1, C=df1 ) )
        expect_equal( nrow( tbl ), 2 )
        
        make.list.table( list( A= df1, B=df2, C=df2 ) )
        
        make.list.table( list( A= df2, B=df2, C=df1 ) )
        
        make.list.table( list( A= df2, B=df2, C=df2 ) )
        
        df1 = data.frame( word=c("*intercept*","wordie"), weight=c(1,2) )
        df2 = data.frame( word=c("*intercept*"), weight=c(1) )
        
        tbl = make.list.table( list( A= df1, B=df1, C=df1 ) )
        expect_equal( nrow(tbl), 1 )
        
        tbl = make.list.table( list( A= df1, B=df1, C=df2 ) )
        expect_equal( nrow(tbl), 1 )
        
    
})


test_that("making word tables works", {

	data( bathtub )
	mth.lab = meta(bathtub)$meth.chl

	rs = textreg( bathtub, mth.lab, c("methylene","chloride"), C = 3, a=1, gap=1, min.support = 5, verbosity=0, convergence.threshold=0.00001, maxIter=100 )
	rs

	rs2 = textreg( bathtub, mth.lab, c("methylene","chloride"), C = 4, a=1, gap=1, min.support = 5, verbosity=0, convergence.threshold=0.00001, maxIter=100 )
	rs2

	rs3 = textreg(  bathtub, mth.lab, c("methylene","chloride"), C = 3, a=1, gap=1, min.support = 5, verbosity=0, convergence.threshold=0.00001, maxIter=100, Lq=5 )
	rs3

	rs4 = textreg(  bathtub, mth.lab, c("methylene","chloride"), C = 50, a=1, gap=1, min.support = 5, verbosity=0, convergence.threshold=0.00001, maxIter=100, Lq=5 )
	rs4

	lst = list( rs, rs2, rs3, rs4 )
	
	tbl <- make.list.table( lst, model.names=c("C=3","C=4","Lq=5","Null"), topic="Testing Topic" )
	tbl
	expect_equal( attr(tbl,"topic"), "Testing Topic" )
	expect_equal( class(tbl), "data.frame" )
	expect_equal( names(tbl)[1:5], c("phrase","C=3","C=4","Lq=5","Null") )

	list.table.chart( tbl )


	tbl <- make.list.table( lst, annotate=FALSE)
	tbl
	expect_equal( ncol(tbl), 4 )
	expect_equal( nrow(tbl), nrow(lst[[3]]$model)-1 )
	
	# check that plotting doesn't crash when called
	list.table.chart( tbl )

	tbl <- make.list.table( lst, annotate=FALSE, method="word")
	tbl
	expect_equal( ncol(tbl), 4 )
	expect_equal( class(tbl[1,1]), "character" )
	
	tbl <- make.list.table( lst, annotate=TRUE, method="word")
	tbl
	expect_equal( nrow(tbl), nrow(lst[[3]]$model)-1 )

	expect_error( make.list.table( rs ) )

	# single table
	lst1 = list( rs2 )
	expect_error( make.list.table( lst1 ) )

	# weight method get right weights.
	tbl <- make.list.table( lst, annotate=FALSE, method="weight")
	tbl
	expect_equal( class(tbl), "matrix" )
	
	corrs = lst[[2]]$model$beta / lst[[2]]$model$Z
	names(corrs) = lst[[2]]$model$ngram
	corrs = corrs[-1] 
	expect_equal( sort( tbl[,2] ), sort(corrs) )

} )



test_that("plotting options don't crash", {
    
    data( bathtub )
    mth.lab = meta(bathtub)$meth.chl
    rs = textreg( bathtub, mth.lab, c("methylene","chloride"), C = 3, a=1, gap=1, min.support = 5, verbosity=0, convergence.threshold=0.00001, maxIter=100 )
    rs2 = textreg( bathtub, mth.lab, c("methylene","chloride"), C = 4, a=1, gap=1, min.support = 5, verbosity=0, convergence.threshold=0.00001, maxIter=100 )
    rs3 = textreg(  bathtub, mth.lab, c("methylene","chloride"), C = 3, a=1, gap=1, min.support = 5, verbosity=0, convergence.threshold=0.00001, maxIter=100, Lq=5 )
    rs4 = textreg(  bathtub, mth.lab, c("methylene","chloride"), C = 50, a=1, gap=1, min.support = 5, verbosity=0, convergence.threshold=0.00001, maxIter=100, Lq=5 )
    lst = list( rs, rs2, rs3, rs4 )
    
    tbl <- make.list.table( lst, model.names=c("C=3","C=4","Lq=5","C=50"), topic="Testing Topic" )

    list.table.chart( tbl, main="Customized title" )

    # only positive and negative
    list.table.chart( tbl, color.breaks = c(-20, 0, 20) )
    
    list.table.chart( tbl, color.breaks = c(-20, 0, 2, 4, 6, 8, 20) )
    
    list.table.chart( tbl, color.ramp = c( "red", "yellow", "blue", "green" ) )
  
    # fancy
    pos.val = rgb( 0, 0, seq( 0.5, 1, length.out=6 ) )
    neg.val = rgb( seq( 1, 0.5, length.out=6 ), 0, 0 )
    my.ramp = c( neg.val, pos.val )
    list.table.chart( tbl, color.ramp=my.ramp )
    
    # more fancy
    my.ramp = c( "red", rgb( 0, 0, seq( 0.5, 1, length.out=5 ) ), "yellow" )
    my.ramp
    my.break = c(-20,0,2,4,6,8,12,20)
    my.break
    list.table.chart( tbl, color.ramp=my.ramp, color.breaks=my.break )
    
    # Adding labels to ends seperating the bins
    list.table.chart( tbl, color.ramp=my.ramp, color.breaks=my.break,
                      dates = c( "A", "B", "C", "D", "E" ) )
    
    # Adding vertical lines and no x-axis
    plt = list.table.chart( tbl, color.ramp=my.ramp, color.breaks=my.break, xaxt="n" )
    abline( v=1, col="red", lwd=5 )    
    abline( v=c(2.5,3.5), col="red", lwd=5 )    
    
    expect_equal( nrow(plt), nrow(tbl))
    expect_true( ncol(plt) <= ncol(tbl))
} )



test_that("make table with no terms works", {
    
    data( bathtub )
    mth.lab = meta(bathtub)$meth.chl
    
    rs = textreg( bathtub, mth.lab, c("methylene","chloride"), C = 30, a=1, gap=1, min.support = 5, verbosity=0, convergence.threshold=0.00001, maxIter=100 )
    rs

    rs2 = textreg( bathtub, mth.lab, c("methylene","chloride"), C = 3, a=1, gap=1, min.support = 5, verbosity=0, convergence.threshold=0.00001, maxIter=100 )
    rs2
    
    lst = list( rs, rs, rs )
    
    tbl <- make.list.table( lst, model.names=c("C=3","C=4","Lq=5"), topic="Testing Topic" )
    tbl
    
    expect_equal( nrow(tbl), 0 )
    
    fakedf = data.frame( word=c("dog","cat"), weight=c(1,2) )
    lst[[2]] = fakedf
    
    tbl <- make.list.table( lst, model.names=c("A","B","C"), topic="Testing Topic" )
    tbl
    
    expect_equal( nrow(tbl), 2 )
    expect_equal( tbl$phrase, c( "cat", "dog" ) )
    expect_equal( tbl$B, c( 2, 1 ) )

    lst[[1]] = rs2
    tbl <- make.list.table( lst, model.names=c("A","B","C"), topic="Testing Topic" )
    tbl
    
    expect_equal( is.na( tbl$num.phrase ), 1==c(0,0,0,0,0,0,1,1 ) )
    
} )




