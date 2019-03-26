library(spam)


### Name: foreign
### Title: Transformation to other sparse formats
### Aliases: foreign as.spam.matrix.csr as.dgRMatrix.spam as.dgCMatrix.spam
###   as.spam.dgRMatrix as.spam.dgCMatrix
### Keywords: array manip

### ** Examples


## Not run: 
##D S <- diag.spam(4)
##D R <- as.dgRMatrix.spam( S) 
##D C <- as.dgCMatrix.spam( S)
##D as.spam.dgCMatrix(C) 
##D slotNames(U)
##D slotNames(R)
##D # For column oriented sparse formats a transpose does not the job,
##D # as the slot names change.
##D 
##D 
##D # as.spam(R) does not work.
## End(Not run)

## Not run: 
##D # for transformations between SparseM and spam:
##D as.matrix.csr.spam <- function(x,...) {
##D     newx <- new("matrix.csr")
##D     slot(newx,"ra",check=FALSE) <- x@entries
##D     slot(newx,"ja",check=FALSE) <- x@colindices
##D     slot(newx,"ia",check=FALSE) <- x@rowpointers
##D     slot(newx,"dimension",check=FALSE) <- x@dimension
##D     return(newx)
##D   }       
##D U <- as.matrix.csr.spam( S) 
## End(Not run)

## Not run: 
##D # a dataset contained in Matrix
##D data(KNex)
##D as.spam.dgCMatrix(KNex$mm) 
##D 
## End(Not run)



