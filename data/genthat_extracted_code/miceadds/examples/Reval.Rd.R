library(miceadds)


### Name: Reval
### Title: R Utilities: Evaluates a String as an Expression in R
### Aliases: Reval Revalpr Revalprstr Revalpr_round Revalpr_maxabs
### Keywords: R utilities

### ** Examples

# This function is simply a shortage function
# See the definition of this function:
Reval <- function( Rstring, print.string=TRUE){
    if (print.string){ cat( paste( Rstring ), "\n"  ) }
        eval.parent( parse( text=paste( Rstring )), n=1 )
            }

Reval( "a <- 2^3" )
  ## a <- 2^3
a
  ## [1] 8



