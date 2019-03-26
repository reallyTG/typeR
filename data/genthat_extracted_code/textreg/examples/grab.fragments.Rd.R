library(textreg)


### Name: grab.fragments
### Title: Grab all fragments in a corpus with given phrase.
### Aliases: grab.fragments

### ** Examples

library( tm )
docs = c( "987654321 test 123456789", "987654321 test test word 123456789", 
       "test at start", "a test b", "this is a test", "without the t-word",
       "a test for you and a test for me" )
corpus <- VCorpus(VectorSource(docs))
grab.fragments( "test *", corpus, char.before=4, char.after=4 )



