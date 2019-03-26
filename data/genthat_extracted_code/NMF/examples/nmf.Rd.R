library(NMF)


### Name: nmf
### Title: Running NMF algorithms
### Aliases: nmf nmf,data.frame,ANY,ANY-method nmf,formula,ANY,ANY-method
###   nmf,matrix,data.frame,ANY-method nmf,matrix,matrix,ANY-method
###   nmf,matrix,missing,ANY-method nmf,matrix,NMF,ANY-method
###   nmf,matrix,NULL,ANY-method nmf,matrix,numeric,character-method
###   nmf,matrix,numeric,function-method nmf,matrix,numeric,list-method
###   nmf,matrix,numeric,missing-method
###   nmf,matrix,numeric,NMFStrategy-method nmf,matrix,numeric,NULL-method
###   nmf-methods
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# Only basic calls are presented in this manpage.
# Many more examples are provided in the demo file nmf.R
## Not run: 
##D demo('nmf')
## End(Not run)

# random data
x <- rmatrix(20,10)

# run default algorithm with rank 2
res <- nmf(x, 2)

# specify the algorithm
res <- nmf(x, 2, 'lee')

# get verbose message on what is going on
res <- nmf(x, 2, .options='v')
## Not run: 
##D # more messages
##D res <- nmf(x, 2, .options='v2')
##D # even more
##D res <- nmf(x, 2, .options='v3')
##D # and so on ...
## End(Not run)



