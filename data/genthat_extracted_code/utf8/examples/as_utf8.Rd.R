library(utf8)


### Name: as_utf8
### Title: UTF-8 Character Encoding
### Aliases: as_utf8 utf8_valid

### ** Examples

# the second element is encoded in latin-1, but declared as UTF-8
x <- c("fa\u00E7ile", "fa\xE7ile", "fa\xC3\xA7ile")
Encoding(x) <- c("UTF-8", "UTF-8", "bytes")

# attempt to convert to UTF-8 (fails)
## Not run: as_utf8(x)

y <- x
Encoding(y[2]) <- "latin1" # mark the correct encoding
as_utf8(y) # succeeds

# test for valid UTF-8
utf8_valid(x)



