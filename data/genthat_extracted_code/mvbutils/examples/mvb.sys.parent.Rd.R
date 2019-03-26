library(mvbutils)


### Name: mvb.sys.parent
### Title: Functions to Access the Function Call Stack
### Aliases: mvb.sys.parent mvb.sys.nframe mvb.parent.frame mvb.eval.parent
###   mvb.match.call mvb.nargs mvb.sys.call mvb.sys.function
### Keywords: programming

### ** Examples

ff.no.eval <- function() sys.nframe()
ff.no.eval() # 1
ff.system <- function() eval( quote( sys.nframe()), envir=sys.frame( sys.nframe()))
ff.system() # expect 1 as per ff.no.eval, get 3
ff.mvb <- function() eval( quote( mvb.sys.nframe()), envir=sys.frame( sys.nframe()))
ff.mvb() # 1
ff.no.eval <- function(...) sys.call()
ff.no.eval( 27, b=4) # ff.no.eval( 27, b=4)
ff.system <- function(...) eval( quote( sys.call()), envir=sys.frame( sys.nframe()))
ff.system( 27, b=4) # eval( expr, envir, enclos) !!!
ff.mvb <- function(...) eval( quote( mvb.sys.call()), envir=sys.frame( sys.nframe()))
ff.mvb( 27, b=4) # ff.mvb( 27, b=4)



