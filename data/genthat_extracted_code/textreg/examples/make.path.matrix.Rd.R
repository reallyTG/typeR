library(textreg)


### Name: make.path.matrix
### Title: Generate matrix describing gradient descent path of textreg.
### Aliases: make.path.matrix

### ** Examples

data( testCorpora )
testI = testCorpora$testI
res = textreg( testI$corpus, testI$labelI, c("frog","goat","bat"), C=2, verbosity=0 )	
make.path.matrix( res )



