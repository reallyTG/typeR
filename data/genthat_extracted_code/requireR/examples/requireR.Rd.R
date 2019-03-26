library(requireR)


### Name: requireR
### Title: Loads given files and modularizes the given function
### Aliases: requireR

### ** Examples

## Not run: 
##D #hello.R
##D requireR(function() {
##D   "hello"
##D })
##D 
##D #world.R
##D requireR(function() {
##D   "world"
##D })
##D 
##D requireR(
##D   "hello.R",
##D    "world.R",
##D    function(hello, world) {
##D      paste(hello, world)
##D    })
## End(Not run)



