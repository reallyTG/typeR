library(OpenRepGrid)


### Name: distanceHartmann
### Title: 'Hartmann distance' (standardized Slater distances).
### Aliases: distanceHartmann

### ** Examples

## Not run: 
##D 
##D    ### basics  ###
##D    
##D    distanceHartmann(bell2010)
##D    distanceHartmann(bell2010, method="simulate")
##D    h <- distanceHartmann(bell2010, method="simulate")
##D    h
##D    
##D    # printing options
##D    print(h)
##D    print(h, digits=6)
##D    # 'significant' distances only
##D    print(h, p=c(.05, .95))
##D 
##D    # access cells of distance matrix
##D    h[1,2]
##D    
##D    ### advanced  ###
##D    
##D    # histogram of Slater distances and indifference region
##D    h <- distanceHartmann(bell2010, distributions=TRUE)
##D    l <- attr(h, "distributions") 
##D    hist(l$slater, breaks=100)
##D    hist(l$hartmann, breaks=100)
## End(Not run)




