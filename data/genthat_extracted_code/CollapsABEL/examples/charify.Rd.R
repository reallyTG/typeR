library(CollapsABEL)


### Name: charify
### Title: Convert certain columns of a data.frame to character type
### Aliases: charify

### ** Examples

## Not run: 
##D x = data.frame(x = 1:3, y= 2:4)
##D all(colClasses(x) == c("integer", "integer"))
##D x = charify(x, "x")
##D all(colClasses(x) == c("character", "integer"))
## End(Not run)




