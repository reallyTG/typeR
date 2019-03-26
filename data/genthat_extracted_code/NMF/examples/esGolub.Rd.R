library(NMF)


### Name: esGolub
### Title: Golub ExpressionSet
### Aliases: esGolub
### Keywords: datasets

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# requires package Biobase to be installed
if( require(Biobase) ){

	data(esGolub)
	esGolub
	## Not run: pData(esGolub)

}



