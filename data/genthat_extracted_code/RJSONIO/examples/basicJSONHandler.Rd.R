library(RJSONIO)


### Name: basicJSONHandler
### Title: Create handler for processing JSON elements from a parser
### Aliases: basicJSONHandler
### Keywords: IO programming

### ** Examples

  h = basicJSONHandler()
  x = fromJSON("[1, 2, 3]", h)
  x
  h$value()



