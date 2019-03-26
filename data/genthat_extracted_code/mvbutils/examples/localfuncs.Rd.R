library(mvbutils)


### Name: localfuncs
### Title: "Declare" child functions, allowing much tidier code
### Aliases: localfuncs
### Keywords: internal

### ** Examples

inner <- function( x) {
  y <<- y+x
  0
}
outer <- function( z) {
  # Multiply z by 2!
  y <- z
  localfuncs( 'inner')
  inner( z)
  return( y)
}
outer( 4) # 8



