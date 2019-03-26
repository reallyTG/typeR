library(mvbutils)


### Name: local.return
### Title: Macro-like functions
### Aliases: local.return
### Keywords: programming

### ** Examples

ffin <- function( nlocal=sys.parent()) mlocal( return( local.return( a)))
ffout <- function( a) ffin()
ffout( 3) # 3
# whereas:
ffin <- function( nlocal=sys.parent()) mlocal( return( a))
ffout( 3) # NULL; "return" alone doesn't work



