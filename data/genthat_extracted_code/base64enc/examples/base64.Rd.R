library(base64enc)


### Name: base64
### Title: Encode/decode data into/from base64 encoding
### Aliases: base64 base64encode base64decode
### Keywords: manip

### ** Examples

  base64encode(1:100)
  base64encode(1:100, 70)
  base64encode(1:100, 70, "\n")
  x <- charToRaw("the decoded content, otherwise the number of bytes")
  y <- base64decode(base64encode(x))
  stopifnot(identical(x, y))



