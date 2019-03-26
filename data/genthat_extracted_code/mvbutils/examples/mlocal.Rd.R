library(mvbutils)


### Name: mlocal
### Title: Macro-like functions
### Aliases: mlocal
### Keywords: programming

### ** Examples

# Tidiness and variable creation
init <- function( nlocal=sys.parent()) mlocal( sqr.a <- a*a)
ffout <- function( a) { init(); sqr.a }
ffout( 5) # 25
# Parameters and temporary variables
ffin <- function( n, nlocal=sys.parent(), a, i) mlocal({
    # this "n" and "a" will temporarily replace caller's "n" and "a"
    print( n)
    a <- 1
    for( i in 1:n)
      a <- a*x
    a
  })
x.to.the.n.plus.1 <- function( x, n) {
    print( ffin( n+1))
    print( n)
    print( ls())
  }
x.to.the.n.plus.1( 3, 2) # prints as follows:
# [1] 3 (in "ffin")
# [1] 27 (result of "ffin")
# [1] 2 (original n)
# [1] "n" "x" (vars in "x.to.the..."-- NB no a or i)
# Use of "nlocal"
ffin <- function( i, nlocal=sys.parent()) mlocal( a <- a+i )
ffout <- function( ivec) { a <- 0; sapply( ivec, ffin, nlocal=sys.nframe()) }
ffout( 1:3) # 1 3 6



