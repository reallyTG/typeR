library(OpenRepGrid)


### Name: distance
### Title: Distance measures (between constructs or elements).
### Aliases: distance

### ** Examples

## Not run: 
##D 
##D    # between constructs
##D    distance(bell2010, along=1)
##D    # between elements
##D    distance(bell2010, along=2)
##D  
##D    # several distance methods
##D    distance(bell2010, dm="man")         # manhattan distance
##D    distance(bell2010, dm="mink", p=3)   # minkowski metric to the power of 3
##D 
##D    # to save the results without printing to the console
##D    d <- distance(bell2010, trim=7)
##D    d
##D    
##D    # some more options when printing the distance matrix
##D    print(d, digits=5)
##D    print(d, col.index=FALSE)
##D    print(d, upper=FALSE)
##D    
##D    # accessing entries from the matrix
##D    d[1,3]
##D 
## End(Not run)




