

# simple tests for textreg package
library( testthat )
library( textreg )
library( tm )

context( "textreg tm interactions" )


test_that("Calls to tm package stemming works as expected", {
    #### Check stemming call to tm_map
    texts <- c("texting goblins the dagger", "text the goblin", "texting 3 goblins appl daggers goblining gobble")
    texts = rep(texts, 1000)

    corpus <- VCorpus(VectorSource(texts))
    length(corpus)
    aa = tm_map(corpus, stemDocument)
    expect_equal( length( corpus), 3000 )
    expect_equal( content( aa[[55]] ), "text goblin the dagger" )


    # Why does this produce a warning?
    corpus <- SimpleCorpus(VectorSource(texts))
    length(corpus)
    aa = tm_map(corpus, stemDocument)
    expect_equal( length( corpus), 3000 )
    expect_equal( content( aa[[55]] ), "text goblin the dagger" )

} )

test_that("SimpleCorpus works ok", {

    cleanFun <- function(htmlString) {
        return(gsub("<.*?>", "", htmlString))
    }

    sample <- "Not to sound clichÈd, but the past four-plus years have been a blur  "

    text_vector <- rep(sample, 1000)
    texts <- cleanFun(text_vector)
    texts[5] = "Apples appealing ride rider riders"

    labels <- c(rep(1, 500), rep(-1, 500))

    # Auto convert from character to corpus check
    expect_warning( corpus_stem <- stem.corpus( texts, verbose = FALSE ) )



    #### tm corpus
    corpus_tm <- VCorpus(VectorSource(texts))

    #corpus_tm <- SimpleCorpus(VectorSource(texts))
    #length( corpus_tm )

    stemmed_tm <- stem.corpus(corpus_tm, verbose = FALSE)
    length( stemmed_tm )


    corpusA <- VCorpus(VectorSource(texts))
    corpusA = corpusA[1:4]

    corpusB <- SimpleCorpus(VectorSource(texts))
    corpusB = corpusB[1:4]

    expect_that( corpusA, is_a( "VCorpus" ) )
    expect_that( corpusB, is_a( "SimpleCorpus" ) )

    stemB <- stem.corpus(corpusB, verbose = FALSE)

    # we change corpus type due to being a new corpus
    expect_that( stemB, is_a( "VCorpus" ) )

    lst <- as.list( corpusA )
    expect_that( lst[[1]], is_a( "TextDocument" ) )

    lstB <- as.list( corpusB )
    expect_that( lstB, is_a( "list" ) )
    expect_that( lstB[[1]], is_a( "character" ) )


    rs <- textreg:::tm_gregexpr( "sound", corpusA )
    expect_that( rs[[1]], is_equivalent_to( 8 ) )

    rs <- textreg:::tm_gregexpr( "sound", corpusB )
    expect_that( rs[[1]], is_equivalent_to( 8 ) )

} )


