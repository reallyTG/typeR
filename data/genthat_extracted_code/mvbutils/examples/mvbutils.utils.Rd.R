library(mvbutils)


### Name: mvbutils.utils
### Title: Miscellaneous utilities
### Aliases: mvbutils.utils as.cat clip cq deparse.names.parsably
###   empty.data.frame env.name.string expanded.call everyth find.funs
###   find.lurking.envs index integ is.dir isF isT legal.filename lsall
###   masked masking mkdir most.recent my.all.equal named nscat nscatn
###   option.or.default pos put.in.session returnList safe.rbind scatn
###   to.regexpr yes.no
### Keywords: misc

### ** Examples

# as.cat
ugly.bugly <- c( 'A rose by any other name', 'would annoy taxonomists')
ugly.bugly
#[1] "A rose by any other name"                 "would annoy taxonomists"
as.cat( ugly.bugly) # calls print.cat--- no clutter
#A rose by any other name
#would annoy taxonomists
clip( 1:5, 2) # 1:3
cq( alpha, beta) # c( "alpha", "beta")
empty.data.frame( a=1, b="yes")
# data.frame with 0 rows of columns "a" (numeric) and "b" (character)
empty.data.frame( a=1, b=factor( c( "yes", "no")))$b
# factor with levels c( "no", "yes")
everyth( 1:10, 3, 5) # c( 5, 8)
f <- function( a=9, b) expanded.call(); f( 3, 4) # list( a=3, b=4)
find.funs( "package:base", patt="an") # "transform" etc.
find.lurking.envs( cd)
#                                     what  size
#1                     attr(obj, "source")  5368
#2                                     obj 49556
#3 environment(obj) <: namespace:mvbutils>   Inf
## Not run: 
##D eapply( .GlobalEnv, find.lurking.envs)
## End(Not run)
integ( sin(x), 0, 1) # [1] 0.4597
integ( sin(x+a), a=5, 0, 1) # [1] -0.6765; 'a' is "passed" to 'expr'
integ( sin(y+a), what='y', 0, 1, a=0) # [1] 0.4597; arg is 'y' not 'x'
is.dir( getwd()) # TRUE
isF( FALSE) # TRUE
isF( NA) # FALSE
isF( c( FALSE, FALSE)) # FALSE, with a warning
sapply( c( FALSE, NA, TRUE), isF)
# [1]  TRUE FALSE FALSE
sapply( c( FALSE, NA, TRUE), isT)
# [1] FALSE FALSE  TRUE
legal.filename( "a:b\\c/d&f") # "a.b.c.d&f"
most.recent( c( FALSE,TRUE,FALSE,TRUE)) # c( 0, 2, 2, 4)
sapply( named( cq( alpha, beta)), nchar)  # c( alpha=5, beta=4)
pos( cq( quick, lazy), "the quick brown fox jumped over the lazy dog")
# matrix( c( 5, 37), nrow=2)
pos( "quick", c( "first quick", "second quick quick", "third"))
# matrix( c( 7,8,0, 0,14,0), nrow=3)
pos( "quick", "slow") # matrix( 0)
f <- function() { a <- 9; return( returnList( a, a*a, a2=a+a)) }
f() # list( a=9, 81, a2=18)
scatn( 'Things %i', 1:3)
nscat( 'Things %i', 1:3)
nscatn( 'Things %i', 1:3)
to.regexpr( "a{{") # "a\\{\\{"
## Not run: 
##D mkdir( "subdirectory.of.getwd")
##D yes.no( "OK (Y/N)? ")
##D masking( 1)
##D masked( 5)
## End(Not run)



