library(OpenRepGrid)


### Name: distanceNormalized
### Title: Standardized inter-element distances' (power transformed
###   Hartmann distances).
### Aliases: distanceNormalized

### ** Examples

## Not run: 
##D 
##D    ### basics  ###
##D    
##D    distanceNormalized(bell2010)
##D    n <- distanceNormalized(bell2010)
##D    n
##D    
##D    # printing options
##D    print(n)
##D    print(n, digits=4)
##D    # 'significant' distances only
##D    print(n, p=c(.05, .95))
##D 
##D    # access cells of distance matrix
##D    n[1,2]
##D    
##D    ### advanced  ###
##D    
##D    # histogram of Slater distances and indifference region
##D    n <- distanceNormalized(bell2010, distributions=TRUE)
##D    l <- attr(n, "distributions") 
##D    hist(l$bc, breaks=100)
##D  
## End(Not run)




