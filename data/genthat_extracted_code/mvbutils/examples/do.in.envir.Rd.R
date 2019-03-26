library(mvbutils)


### Name: do.in.envir
### Title: Modify a function's scope
### Aliases: do.in.envir
### Keywords: programming utilities

### ** Examples

fff <- function( abcdef) ffdie( 3)
ffdie <- function( x) do.in.envir( { x+abcdef} )
fff( 9) # 12; ffdie wouldn't know about abcdef without the do.in.envir call
# Show sys.call issues
# Note that the "envir" argument in this case makes the
# "do.in.envir" call completely superfluous!
ffe <- function(...) do.in.envir( envir=sys.frame( sys.nframe()), sys.call( -5))
ffe( 27, b=4) # ffe( 27, b=4)



