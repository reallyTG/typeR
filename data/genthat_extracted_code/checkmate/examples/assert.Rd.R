library(checkmate)


### Name: assert
### Title: Combine multiple checks into one assertion
### Aliases: assert

### ** Examples

x = 1:10
assert(checkNull(x), checkInteger(x, any.missing = FALSE))
## Not run: 
##D x = 1
##D assert(checkChoice(x, c("a", "b")), checkDataFrame(x))
## End(Not run)



