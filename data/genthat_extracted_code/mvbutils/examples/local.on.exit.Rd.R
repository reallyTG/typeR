library(mvbutils)


### Name: local.on.exit
### Title: Macro-like functions
### Aliases: local.on.exit
### Keywords: programming

### ** Examples

ffin <- function( nlocal=sys.parent(), x1234, yyy) mlocal({
  x1234 <- yyy <- 1 # x1234 & yyy are temporary variables
  # on.exit( cat( yyy)) # would crash after not finding yyy
  local.on.exit( cat( yyy))
  })
ffout <- function() {
  x1234 <- 99
  ffin()
  x1234 # still 99 because x1234 was temporary
}
ffout()



