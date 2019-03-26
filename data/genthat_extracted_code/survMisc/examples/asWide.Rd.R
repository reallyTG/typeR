library(survMisc)


### Name: asWide
### Title: Convert an object to "wide" or "long" form.
### Aliases: asWide asWide.ten asLong asLong.ten

### ** Examples

## Not run: 
##D data("bmt", package="KMsurv")
##D require("survival")
##D t1 <- ten(c1 <- coxph(Surv(t2, d3) ~ z3*z10, data=bmt))
##D asWide(t1)
## End(Not run)
## Not run: 
##D asLong(asWide(t1))
##D stopifnot(asLong(asWide(t1)) == ten(ten(t1)))
## End(Not run)



