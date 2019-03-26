library(CollapsABEL)


### Name: changeByMap
### Title: Transform a vector by a mapping
### Aliases: changeByMap

### ** Examples

## Not run: 
##D names_dat = data.frame(c("a", "b", "c"), c("d", "e", "f"), stringsAsFactors=FALSE)
##D changeByMap(c("a", "a", "b"), names_dat) == c("d", "d", "e")
##D x = changeByMap(c(NA, "a", "b"), names_dat)
##D is.na(x[1])
## End(Not run)



