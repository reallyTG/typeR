library(IMPACT)


### Name: IMPACT
### Title: The Impact of Items
### Aliases: IMPACT

### ** Examples

## Not run: 
##D library(IMPACT)
##D ##Reads a likert-type scale dataset
##D x<-matrix(c(2, 5, 5, 4, 4, 5, 4, 4, 5, 1, 3, 4, 4, 1, 5, 2, 2, 4, 3, 5,
##D 5, 1, 1, 4, 5, 2, 2, 4, 4, 5, 2, 4, 2, 5, 3, 4, 3, 3, 5, 3,
##D 3, 5, 5, 5, 5, 5, 5, 5, 5, 3, 4, 3, 5, 3, 4, 5, 4, 4, 4, 5,
##D 4, 1, 2, 2, 3, 1, 1, 3, 2, 5, 3, 2, 1, 5, 2, 2, 4, 1, 5, 1,
##D 2, 4, 4, 4, 3, 5, 5, 4, 2, 2, 4, 3, 5, 2, 4, 5, 4, 4, 1, 5,
##D 4, 1, 2, 3, 3, 1, 2, 5, 4, 5, 4, 3, 1, 4, 1, 3, 4, 2, 4, 2,
##D 4, 1, 2, 3, 4, 1, 1, 4, 4, 5, 3, 3, 1, 1, 1, 4, 4, 2, 4, 1,
##D 5, 1, 3, 3, 4, 5, 3, 5, 4, 5, 4, 4, 2, 5, 2, 4, 4, 4, 4, 4,
##D 4, 4, 2, 3, 1, 3, 2, 3, 3, 1, 1, 2, 4, 1, 5, 2, 2, 3, 3, 4),20,10)
##D ##Put names of variables
##D colnames(x)<-c(paste("A","-",1:10))
##D ##Declare a null value
##D y<-3
##D IMPACT(x,y)
## End(Not run)




