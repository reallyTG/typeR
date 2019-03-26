library(berryFunctions)


### Name: owa
### Title: Overwrite argument default lists
### Aliases: owa
### Keywords: programming

### ** Examples

# The motivation behind owa:
testfun <- function(...) {plot(7:11, ...) ; legend("top", "some text", ...)}
testfun()
is.error( testfun(type="o") , tell=TRUE)
# Error: legend doesn't have the argument 'type'!

# How to solve this:
testfun <- function(legargs=NULL, ...) # dots passed to plot
   {
   plot(7:11, ...)
   legend_defaults <- list(x="top", lty=1, col="red", legend="owa rocks!")
   # combine defaults and user specified into final argument list,
   # overwrite arguments ('owa') in the default list unless protected:
   legend_final <- owa(d=legend_defaults, a=legargs, "col", "lwd")
   do.call(legend, args=legend_final)
   }

testfun()
testfun(type="l", col="blue")
testfun(type="o", legargs=list(col="blue", pch=16, lty=3) )
# color in legargs is ignored, as it is defined as unchangeable


#----------------------------------------------------------------------------

# basic tests of owa itself:
d <- list(bb=1:5, lwd="was d", lty=1,   col="gray")
a <- list(bb=3,   lwd=5, lty="from a", wachs="A")
owa(d,a) # all changed, wachs added
owa(d, a, "bb", "lwd") # lty is overwritten, bb and lwd are ignored
owa(d, NULL, "bb", "wachs") # NULL is a good default for argument lists
owa(d, c(HH=2, BBB=3) ) # vectors and lists are all converted to lists
owa(d, list(lwd=5, bb=3, lty="1") ) # order of arguments doesn't matter
owa(d, a, c("bb","lwd") ) # unchangeable can also be a named vector
owa(d, a, c("bb","lwd"), c("lty","dummy") ) # or several vectors





