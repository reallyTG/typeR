library(textreg)


### Name: textreg
### Title: Sparse regression of labeling vector onto all phrases in a
###   corpus.
### Aliases: textreg

### ** Examples

data( testCorpora )
textreg( testCorpora$testI$corpus, testCorpora$testI$labelI, c(), C=1, verbosity=1 )



