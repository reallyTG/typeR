library(locits)


### Name: covIwrap
### Title: A wrapper for the covI function.
### Aliases: covIwrap
### Keywords: ts ~kwd2

### ** Examples

P1 <- PsiJ(-5, filter.number=1, family="DaubExPhase")
#
# First call to covIwrap
#
ans <- covIwrap(S=c(1/2, 1/4, 1/8, 1/16, 1/32), m=1, n=3, ll=5,
    storewrap=NULL, P=P1)
#
# Make sure you keep the storewrap component.
#
my.storewrap <- ans$storewrap
#
# What is the answer?
#
ans$ans
#[1] 0.8430809
#
# Issue next call to covIwrap: but storewrap argument is now the one we stored.
#
ans <- covIwrap(S=c(1/2, 1/4, 1/8, 1/16, 1/32), m=1, n=3, ll=5,
    storewrap=my.storewrap, P=P1)
#
# This call will reuse the stored value. However, if you change any of the
# arguments then the store won't be used.




