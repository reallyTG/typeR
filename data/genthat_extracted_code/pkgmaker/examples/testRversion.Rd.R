library(pkgmaker)


### Name: testRversion
### Title: Testing R Version
### Aliases: testRversion

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


testRversion("2.14")
testRversion("2.15")
testRversion("10")
testRversion("10", test = -1)
testRversion("< 10")
testRversion(Rversion())
testRversion(paste0('=', Rversion()))




