library(hash)


### Name: .set
### Title: assign key-value pair(s) to a hash
### Aliases: .set
### Keywords: methods data manip

### ** Examples


  h <- hash()

  .set( h, keys=letters, values=1:26 )
  .set( h, a="foo", b="bar", c="baz" )
  .set( h, c( aa="foo", ab="bar", ac="baz" ) )
  clear(h)
  .set( h, letters, values )




