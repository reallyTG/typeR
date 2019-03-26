

# simple tests for textreg package
library( testthat )
library( textreg )
library( tm )

context( "cleaning text" )

test_that("simple stem doc example", {
	library( tm )
	texts <- c("texting goblins the dagger", "text these goblins", "texting 3 goblins appl daggers goblining gobble")
	corpus <- VCorpus(VectorSource(texts))
	stemmed_corpus<-stem.corpus(corpus, verbose=FALSE)
	stemmed_corpus[[2]]
	expect_equal( content( stemmed_corpus[[2]] ), "text+ these goblin+" )
} )

test_that("basic cleaning and stemming tests", {
	data( dirtyBathtub )

	bigcorp = VCorpus( VectorSource( dirtyBathtub$text ) )
	corpus = clean.text( bigcorp )
	bccc = stem.corpus( corpus, verbose=FALSE )

	data( bathtub )
	
	expect_equal( nrow(dirtyBathtub), length(bathtub) )
} )





test_that("dirtyBathtub check", {
	data( dirtyBathtub )
	data( bathtub )
	
	expect_equal( nrow(dirtyBathtub), length(bathtub) )
	
	bc = VCorpus( VectorSource( dirtyBathtub$text ) )
	bc.clean = clean.text( bc )
	expect_equal( convert.tm.to.character(bathtub), 		
				convert.tm.to.character( bc.clean ) )
} )




test_that("stemming check", {
	texts<- c('text', 'texting', 'a donky')
	corpus <- VCorpus(VectorSource(texts))
	stemmed_corpus<-stem.corpus(corpus, verbose=FALSE)
	cc = convert.tm.to.character(stemmed_corpus)
	names(cc) <- NULL
	expect_equal( cc, c("text+",    "text+",    "a donki+") )
	
	texts <- c("texting goblins the dagger", "text the goblin", "texting 3 goblins appl daggers goblining gobble")
	texts = rep(texts, 1000)

	corpus <- VCorpus(VectorSource(texts))
	stemmed_corpus <- stem.corpus(corpus, verbose=FALSE)
    cc <- convert.tm.to.character(stemmed_corpus)[1:4]
    names(cc) <- NULL
	expect_equal( cc, c("text+ goblin+ the dagger+", "text+ the goblin+" , "text+ 3 goblin+ appl dagger+ goblin+ gobbl+" ,"text+ goblin+ the dagger+" ) )

} )



test_that("stemming doesn't create multiple '+'", {
    data( dirtyBathtub )
    
    bigcorp = VCorpus( VectorSource( dirtyBathtub$text ) )
    corpus = clean.text( bigcorp )
    bccc = stem.corpus( corpus, verbose=FALSE )
    
    data( bathtub )
    
    rs = tm_filter(bccc, FUN = function(x) any(grep("++", content(x), fixed=TRUE)))
    expect_equal( length( rs ), 0 )
    
    bccc[[5]]$content = "this is a bag++ dog"
    rs = tm_filter(bccc, FUN = function(x) any(grep("++", content(x), fixed=TRUE)))
    expect_equal( length( rs ), 1 )
    
} )



