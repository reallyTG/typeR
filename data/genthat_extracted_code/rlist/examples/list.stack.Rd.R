library(rlist)


### Name: list.stack
### Title: Stack all list elements to tabular data
### Aliases: list.stack

### ** Examples

## Not run: 
##D x <- lapply(1:3, function(i) { list(a=i,b=i^2) })
##D list.stack(x)
##D 
##D x <- lapply(1:3, function(i) { list(a=i,b=i^2,c=letters[i])})
##D list.stack(x)
##D 
##D x <- lapply(1:3, function(i) { data.frame(a=i,b=i^2,c=letters[i]) })
##D list.stack(x)
##D 
##D x <- lapply(1:3, function(i) { data.frame(a=c(i,i+1), b=c(i^2,i^2+1))})
##D list.stack(x)
## End(Not run)



