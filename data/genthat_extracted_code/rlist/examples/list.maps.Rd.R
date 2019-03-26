library(rlist)


### Name: list.maps
### Title: Map multiple lists with an expression
### Aliases: list.maps

### ** Examples

## Not run: 
##D l1 <- list(p1=list(x=1,y=2), p2=list(x=3,y=4), p3=list(x=1,y=3))
##D l2 <- list(2,3,5)
##D list.maps(a$x*b+a$y,a=l1,b=l2)
##D list.maps(..1$x*..2+..1$y,l1,l2)
## End(Not run)



