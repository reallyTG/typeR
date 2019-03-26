library(pkgmaker)


### Name: iterCount
### Title: Simple Text Iteration Counter
### Aliases: iterCount

### ** Examples

## Don't show: 
options(R_CHECK_RUNNING_EXAMPLES_=TRUE) ## roxygen generated flag
## End(Don't show)


progress <- iterCount(LETTERS)
res <- sapply(LETTERS, function(x){
 Sys.sleep(.1)
	progress()
})
# terminate counter
i_end <- progress(NULL)
i_end 




