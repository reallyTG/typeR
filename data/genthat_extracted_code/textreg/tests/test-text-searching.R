##
## test the phrase grabbing functions
##

# simple tests for textreg package
library( testthat )
library( textreg )
library( tm )

context( "Basic Utility Functions" )



test_that( "phrase expansion works", {
	expect_equal( textreg:::make_search_phrases( "hi" ), "\\bhi\\b" )
	
	expect_equal( textreg:::make_search_phrases( c() ), c() )

	expect_equal( textreg:::make_search_phrases( NULL ), c() )
	
	expect_equal( textreg:::make_search_phrases( c( "A * B", "this *" ) ), c( "\\bA \\w+[+]? B\\b", "\\bthis \\w+[+]?\\b" ) )
	
	expect_equal( textreg:::make_search_phrases( c( "AA+", "A+ B+", "A+ *" ) ), c( "\\bAA\\w*[+]?\\b", "\\bA\\w*[+]? B\\w*[+]?\\b", "\\bA\\w*[+]? \\w+[+]?\\b" ) )

		 
} )










test_that( "Capitalization of subphrase works", {
	docs = c( "987654321 test 123456789", "987654321 test word 123456789", "test at start", "a test b", "this is a test", "no test for hamsters", "without the t-word" )
	res = grab.fragments( "test", docs, char.before=4, char.after=4, clean=FALSE )
	expect_equal( as.character(res), c( "321 TEST 123", "321 TEST wor", "TEST at ",    "a TEST b",     "s a TEST",     "no TEST for", "NULL" ) )

	res = grab.fragments( "test *", docs, char.before=4, char.after=4, clean=FALSE )
	reslist = c( "321 TEST 123456789", "321 TEST WORD 123", "TEST AT sta",    "a TEST B",     "NULL",     "no TEST FOR ham", "NULL" )
	expect_equal( as.character(res), reslist )

	res = grab.fragments( "test *", docs, char.before=4, char.after=4, cap.phrase=FALSE )
	expect_equal( as.character(res)[1:4], tolower(reslist )[1:4] )

	res = grab.fragments( "test * hamsters", docs, char.before=4, char.after=4, clean=FALSE )
	expect_equal( as.character(res), c( "NULL", "NULL", "NULL", "NULL", "NULL", "no TEST FOR HAMSTERS", "NULL" ) )

	expect_error( grab.fragments( c("test","start"), docs, char.before=4, char.after=4, clean=FALSE ) )
	expect_error( grab.fragments( "", docs, char.before=4, char.after=4, clean=FALSE ) )

} )



test_that( "White space at ends doesn't break", {
	docs = c( "test pig", "test", "test ", "test piggy ", "no t-word " )

	res = grab.fragments( "test", docs, char.before=4, char.after=4, clean=FALSE )

	reslist = c("TEST pig",    "TEST",        "TEST ",        "TEST pig", "NULL"   )
	expect_equal( as.character(res), reslist )
	
	res = grab.fragments( "test *", docs, char.before=4, char.after=4, clean=FALSE )
	
	reslist = c("TEST PIG",    "NULL",        "NULL",        "TEST PIGGY ", "NULL"   )
	expect_equal( as.character(res), reslist )
	
} )


test_that( "Stemming searches work", {
	docs = c( "test pig", "testing", "test dog", "test ", "test", "test piggy ", "no t-word " )

	res = grab.fragments( "test+", docs, char.before=4, char.after=4, clean=FALSE )
	expect_equal( as.character(res), c("TEST pig", "TESTING",  "TEST dog", "TEST ",    "TEST"  ,   "TEST pig" ,"NULL"   ) )

	
} )


test_that( "Stemming searches work (with corpus object)", {
    docs = c( "test pig", "testing", "test dog", "test ", "test", "test piggy ", "no t-word " )
    docs <- VCorpus(VectorSource(docs))
    
    res = grab.fragments( "test+", docs, char.before=4, char.after=4, clean=FALSE )
    res
    expect_equal( as.character(res), c("TEST pig", "TESTING",  "TEST dog", "TEST ",    "TEST"  ,   "TEST pig" ,"NULL"   ) )
} )



test_that( "multiple words with stemming works on stemmed data" , {
    
    data( bathtub )
    bccc = stem.corpus( bathtub, verbose=FALSE )
    
    bccc = bccc[1]
    
    bccc[[1]]$content
    bathtub[[1]]$content
    
    gregexpr( "the", bccc[[1]]$content, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE )
    
    gregexpr( "ignit+ the", bccc[[1]]$content, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE )
    gregexpr( "ignit+ the", bccc[[1]]$content, ignore.case=FALSE, perl=FALSE, fixed=TRUE, useBytes=FALSE )
    gregexpr( "boooooo", bccc[[1]]$content, ignore.case=FALSE, perl=FALSE, fixed=TRUE, useBytes=FALSE )
    
    textreg:::tm_gregexpr( "ignit+ the", bccc )
    textreg:::tm_gregexpr( "ignit+ the", bccc, fixed = TRUE )
    
        
    sp = textreg:::make_search_phrases( "ignit+ the" )
    sp
    res = gregexpr(  sp, bccc[[1]]$content, ignore.case=FALSE, perl=FALSE, fixed=FALSE, useBytes=FALSE )
    expect_equal( as.numeric( res[[1]] ), 203L )
    
    sp = textreg:::make_search_phrases( "burn+" )
    sp
    
    res = grab.fragments( "burn+", bccc, char.before=4, char.after=4, clean=FALSE )
    res
    expect_equal( as.character(res[[1]]), c("was BURN+ ov", "was BURNT ove") )
    
    res = grab.fragments( "the pilot", bccc, char.before=4, char.after=4, clean=FALSE )
    as.character(res[[1]])
    expect_equal( as.character(res[[1]]), c("it+ THE PILOT lig" ) )
    
    res = grab.fragments( "ignit+ the", bccc, char.before=4, char.after=4, clean=FALSE )
    expect_equal( as.character(res[[1]]), c("ent IGNIT+ THE pil" ) )
    
} )


test_that( "Searching on stemmed documents", {
    data( bathtub )
    bccc = stem.corpus( bathtub, verbose=FALSE )
    
    bccc = bccc[1]

    bccc[[1]]$content
    
    res = grab.fragments( "burn+", bccc, char.before=4, char.after=4, clean=FALSE )
    res
    expect_equal( as.character(res[[1]]), c("was BURN+ ov", "was BURNT ove") )

    res = grab.fragments( "the pilot", bccc, char.before=4, char.after=4, clean=FALSE )
    as.character(res[[1]])
    expect_equal( as.character(res[[1]]), c("it+ THE PILOT lig" ) )

    res = grab.fragments( "ignit+ the", bccc, char.before=4, char.after=4, clean=FALSE )
    res
    as.character(res[[1]])
    expect_equal( as.character(res[[1]]), c("ent IGNIT+ THE pil" ) )
    
} )









# check phrase counting 
test_that( "phrase.count.table", {
	data( bathtub )
	mat = make.phrase.matrix( c( "a", "and", "bathtub", "falling", "asdfac", "stripper" ), bathtub )
	expect_equal( dim( mat ), c( length(bathtub), 6 ) )
	expect_equal( as.numeric(mat[2,]), c(5,2,1,1,0,0) )
} )



# check phrase counting 
test_that( "make.count.table()", {
    data( bathtub )
    lab = meta( bathtub, "meth.chl" )
    length(lab)
    mat = make.count.table( c( "a", "and", "bathtub", "falling", "asdfac", "stripper" ), lab$meth.chl, bathtub )
    mat
    expect_equal( nrow( mat ), 6 )
    expect_equal( ncol( mat ), 4 )
    expect_equal( mat$n, c( 123, 110, 16, 2, 0, 10 ) )
} )

# check phrase counting 
test_that( "make.count.table() wildcards", {
    data( bathtub )
    lab = meta( bathtub, "meth.chl" )
    length(lab)
    mat = make.count.table( c( "applying * cement", "installing * batht+", "bathtu+", "batht+", "asdfac", "strip+" ), lab$meth.chl, bathtub )
    mat
    expect_equal( nrow( mat ), 6 )
    expect_equal( ncol( mat ), 4 )
    expect_equal( mat$n, c( 1, 1, 16, 16, 0, 15 ) )
} )




test_that( "Order of parameters error trap is ok", {
	data( bathtub )

	expect_error( phrase.count( bathtub, "bathtub" ) )	
	
	res = phrase.count( "bathtub", bathtub )
	expect_equal( sum( res > 0 ), 16 )
	
	
	expect_error( grab.fragments( corp, "bathtub" ) )
} )









context( "Searching for Phrases" )

test_that( "Documentation Example of make.count.table runs", {
	library( tm )
	data( bathtub )
	lbl = meta( bathtub )$meth.chl
	make.count.table( c("bathtub","strip+", "vapor *"), lbl, bathtub )
	
	head( make.phrase.matrix( c("bathtub","strip+", "vapor *"), bathtub ) )
	
	pc = phrase.count( "bathtub", bathtub )
	expect_equal( class( pc ), "numeric" )
	expect_equal( length( pc ), 127 )
} )


test_that( "get list of subphrases right", {
	
	data( bathtub )
	
	# get labeling
	lab = meta( bathtub )$meth.chl
	head( lab )

	bans = c("methylene","chloride" )
	rs = textreg( bathtub, lab, bans, C=4, gap=1, verbosity=0 )		
	#rs
	
	tt = phrase.count( "paint", bathtub)
#	table( tt )

	chm = rs$model[ rs$model$ngram=="paint", ]
	expect_equal( sum( tt > 0 ), chm$totalDocs )
	expect_equal( sum( tt == 0 ), length(lab)-chm$totalDocs )
		
	tab = make.phrase.matrix( c( "paint", "bathtub", "tub * a" ), bathtub )
	expect_equal( as.numeric( table( tab[,1] ) ), 
				as.numeric( table( tt ) ) )
	

	ct = make.count.table( c( "paint", "vapors * heavier", "on the * floor", "bathtub", "tub * a", "bath", "stripper *" ), lab, bathtub )
#	ct
	
	mod = rs$model
	mod
	expect_equal( mod[ "vapors * heavier", "totalDocs" ], ct[ "vapors * heavier", "n" ] )
	expect_equal( mod[ "vapors * heavier", "posCount" ], ct[ "vapors * heavier", "n.pos" ] )
	expect_equal( mod[ "stripper *", "totalDocs" ], ct[ "stripper *", "n" ] )
	expect_equal( mod[ "stripper *", "posCount" ], ct[ "stripper *", "n.pos" ] )

#	table( tab$bathtub > 0, lab )

} )



test_that( "grabbing fragments works", {
	
	data( bathtub )
	expect_equal( length(bathtub), 127 )
	
	
	lab = meta( bathtub )$meth.chl
		
	# all appearances of "bathtub"
	tmp = grab.fragments( "bathtub", bathtub, char.before=20, char.after=20, 	clean=TRUE )
	
	expect_equal( as.numeric( table( sapply( tmp, length ) ) ), c( 13, 2, 1 ) ) # no faith in 13, 2, 1

	# looking at what "a bathtub" and "tub * a" are from
	frags = sample.fragments( "a bathtub", lab, bathtub, 20 )
	
    #	print( frags )
	expect_output( print( frags ), "Appearance of" )
	expect_output( print( frags ), "Profile of Summary Phrase: 'a bathtub'" )
	expect_output( print( frags ), "Positive: 5/17 = 29.41" )
	expect_output( print( frags ), "on january XX XXXX an employee was refinishing A BATHTUB in a private residence the bathroom in which the employee was working was small" )
	
	#print( head(frags) )
	
	
	frags = sample.fragments( "tub * a", lab, bathtub, 20 )
	expect_output( print( frags ), "Positive: 3/17 = 17.65" )
	expect_output( print( frags ), "Negative: 0/110 = 0.00" )

	#print( head(frags) )
	
} )




test_that( "sample.fragments and setting phrase lengths works", {
	docs = c( "987654321 test 123456789", "987654321 test word 123456789", "test at start", "a test b", "this is a test", "no test for hamsters", "without the t-word" )
	lab = c(1,1,1,1,-1,-1,-1)
	corpus <- VCorpus(VectorSource(docs))
		
	reslist = c( "321 TEST 123456789", "321 TEST WORD 123", "TEST AT sta",    "a TEST B",     "NULL",     "no TEST FOR ham", "NULL" )

	res = sample.fragments( c( "test *", "test * hamsters" ), lab, corpus, char.before=4, char.after=4, metainfo="testing" )
	expect_equal( class( res[[1]] ), "fragment.sample" )
	expect_equal( res[[1]]$phrase, "test *" )
	expect_equal( as.character(res[[1]]$resP), reslist[1:4] )
	expect_equal( as.character(res[[1]]$resN), reslist[6] )
	expect_equal( res[[1]]$nP, 4 )
	expect_equal( res[[1]]$nN, 3 )
	expect_equal( res[[1]]$nfP, 4 )
	expect_equal( res[[1]]$nfN, 1 )

	expect_equal( res[[1]]$metainfo, "testing" )

	res = sample.fragments( c( "test *", "test * hamsters" ), lab, corpus )
	expect_equal( res[[1]]$metainfo, NULL )
	expect_equal( tolower( as.character(res[[1]]$resP) ), docs[1:4] )
	expect_equal( tolower( as.character(res[[1]]$resN) ), docs[6] )

} )



test_that( "testing multiples in grab.fragments", {
	docs = c( "987654321 test 123456789", "987654321 test test word 123456789", "test at start", "a test b", "this is a test", "no test for hamsters", "without the t-word", "a test and test next", "a test for you and a test for me" )
	corpus <- VCorpus(VectorSource(docs))
	
	reslist = c( "321 TEST 123456789", "321 TEST TEST wor", "TEST AT sta",    "a TEST B",      "no TEST FOR ham",  "a TEST AND tes", "and TEST NEXT", "a TEST FOR you", "d a TEST FOR me" )

	res = grab.fragments( "test *", corpus, char.before=4, char.after=4 )
	res
	expect_equal( as.character( unlist( res ) ), reslist )
	expect_equal( res[c(5,7)], list('5'=NULL, '7'=NULL) )
} )





test_that( "more tests of sample.fragments", {
	docs = c( "987654321 test 123456789", "987654321 test word 123456789", "test at start", "a test b", "this is a test", "no test for hamsters", "without the t-word" )
	lab = c(1,1,1,1,-1,-1,-1)
	corpus <- VCorpus(VectorSource(docs))
	
	rs = make.count.table( c("test","word"), lab, corpus )
	expect_equal( nrow(rs), 2 )
	expect_equal( ncol(rs), 4 )
	expect_equal( rs$n, c(6,2) )
	expect_equal( rs$n.pos, c(4,1) )


	rs = make.count.table( c("word"), lab, corpus )
	expect_equal( nrow(rs), 1 )
	expect_equal( ncol(rs), 4 )
	expect_equal( rs$n, c(2) )
	expect_equal( rs$n.pos, c(1) )

	make.phrase.matrix(  c("test","word"), corpus )


	reslist = c( "321 TEST 123456789", "321 TEST WORD 123", "TEST AT sta",    "a TEST B",     "NULL",     "no TEST FOR ham", "NULL" )

	res = sample.fragments( c( "test *", "test * hamsters" ), lab, corpus, char.before=4, char.after=4, metainfo="testing" )
	expect_equal( class( res[[1]] ), "fragment.sample" )
	expect_equal( res[[1]]$phrase, "test *" )
	expect_equal( as.character(res[[1]]$resP), reslist[1:4] )
	expect_equal( as.character(res[[1]]$resN), reslist[6] )
	expect_equal( res[[1]]$nP, 4 )
	expect_equal( res[[1]]$nN, 3 )
	expect_equal( res[[1]]$nfP, 4 )
	expect_equal( res[[1]]$nfN, 1 )

	expect_equal( res[[1]]$metainfo, "testing" )

	res = sample.fragments( c( "test *", "test * hamsters" ), lab, corpus )
	expect_equal( res[[1]]$metainfo, NULL )
	expect_equal( tolower( as.character(res[[1]]$resP) ), docs[1:4] )
	expect_equal( tolower( as.character(res[[1]]$resN) ), docs[6] )

} )




test_that( "grab.fragments with wildcards and stemming", {
    docs = c( "politics is awesome", "Beware Political People!", "behold the happy politic", "the sad politic", "the happy political process" )
    docs = tolower( docs )
    corpus <- VCorpus(VectorSource(docs))
    
    got = grab.fragments( "polit+", corpus )
    expect_equal( length( got ), 5 )
    expect_equal( got[[4]], "the sad POLITIC" )
    
    grab.fragments( "the * polit+", corpus )
    
    
    c.stem = stem.corpus( corpus, verbose = FALSE )
    convert.tm.to.character( c.stem )
    
    grab.fragments( "polit+", c.stem )    
    grab.fragments( "the * polit+", c.stem )
} )

