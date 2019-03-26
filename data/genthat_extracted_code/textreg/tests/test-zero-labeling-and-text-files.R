##
## test dropping documents and different ways of giving corpus
## to textreg C++ function.
##

library( testthat )
library( textreg )

context( "Zero Labeling and Text Files " )


# check phrase counting
test_that( "reading from file works", {
	
	# should use system.file( "data/text_file.txt", package="textreg" )
	write( "A\nA A\nA B A\nA C A\nB\nC\nA", file="/tmp/testfile.txt" )
	lab = c( 1, 1, 1, 0, 0, -1, 1 )	
	res3 = textreg( "/tmp/testfile.txt", lab, verbosity=0, positive.only=TRUE )
	expect_equal( length( res3$labeling ), 5 )
	expect_equal( length( res3$rules), 2 )
} )




# check phrase counting
test_that( "simple drop zeros works when reading from file", {
	
	write( "A\nA A\nA B A\nA C A\nB\nC\nA", file="/tmp/testfile.txt" )
	
	corp = read.table( file="/tmp/testfile.txt", as.is=TRUE, header=FALSE, sep="\n" )$V1
	lab = c( 1, 1, 1, 0, 0, -1, 1 )
	data.frame( corp=corp, lab=lab )
	res = textreg( corp, lab, verbosity=0, positive.only=TRUE )
	res
	expect_equal( length( predict( res ) ), 5 )
	expect_equal( res$model$support, c(5, 6) )
	
	bcorp = Corpus( VectorSource( corp ) )
	res2 = textreg( corp, lab, verbosity=0, positive.only=TRUE )
	expect_equal( res, res2 )
	
	res3 = textreg( "/tmp/testfile.txt", lab, verbosity=0, positive.only=TRUE )
	res3
	expect_equal( res, res3 )

} )


