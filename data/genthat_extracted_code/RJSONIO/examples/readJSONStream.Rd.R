library(RJSONIO)


### Name: readJSONStream
### Title: Read JSON from a Connection/Stream
### Aliases: readJSONStream
### Keywords: IO

### ** Examples

## Not run: 
##D xx = '[1,2, 3]{"a": [true, false]}'
##D con = textConnection(xx)
##D 
##D f = function(x)
##D        print(sum(unlist(x)))
##D 
##D readJSONStream(con, f)
##D 
##D   # The callback function can be anonymous
##D con = textConnection(xx)
##D readJSONStream(con, function(x)
##D                        print(sum(unlist(x))))
##D 
##D 
##D 
##D gen = 
##D function() {
##D  ans <- 0
##D  list(update = function(x) ans <<- ans + sum(unlist(x)),
##D       value = function() ans)
##D }
##D g = gen()
##D con = textConnection(xx)
##D readJSONStream(con, g$update)
## End(Not run)



