library(OpenRepGrid)


### Name: constructD
### Title: Calculate Somers' d for the constructs.
### Aliases: constructD

### ** Examples

## Not run: 
##D 
##D    constructD(fbb2003)       # columns as dependent (default)
##D    constructD(fbb2003, "c")  # row as dependent
##D    constructD(fbb2003, "s")  # symmetrical index
##D  
##D    # surpress printing
##D    d <- constructD(fbb2003, out=0, trim=5)
##D    d
##D    
##D    # more digits
##D    constructD(fbb2003, dig=3)
##D 
##D    # add index column, no trimming
##D    constructD(fbb2003, col.index=TRUE, index=F, trim=NA)  
##D 
## End(Not run)




