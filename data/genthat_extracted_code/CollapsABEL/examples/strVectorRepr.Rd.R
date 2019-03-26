library(CollapsABEL)


### Name: strVectorRepr
### Title: String Representation of a character vector
### Aliases: strVectorRepr

### ** Examples

## Not run: 
##D strVectorRepr(letters[1:3]) == 'c("a", "b", "c")'
##D strVectorRepr(
##D   as.character(1:3)) == 'c("1", "2", "3")'
##D all(eval(parse(text = strVectorRepr(as.character(1:3)))) == 
##D   c("1", "2", "3"))
## End(Not run)




