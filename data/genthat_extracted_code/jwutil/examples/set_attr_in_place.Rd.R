library(jwutil)


### Name: set_attr_in_place
### Title: Set attribute on any SEXP in place
### Aliases: set_attr_in_place

### ** Examples

## Not run: 
##D # benchmark to see whether setting an attribute on a function argument and returning it does a copy.
##D f <- function(x) { attr(x, "a") <- FALSE; x }
##D p <- generate_random_short_icd9(1)
##D q <- generate_random_short_icd9(1e6)
##D times <- 1e5
##D microbenchmark::microbenchmark(f(p), set_attr_in_place(p, "a", FALSE),
##D                                f(q), set_attr_in_place(q, "a", FALSE), times = times)
##D p2 <- p3 <- generate_random_short_icd9(1)
##D set_attr_in_place(p2, "a", FALSE)
##D stopifnot(identical(f(p3), p2))
##D # oh dear, \code{f} does copy.
##D 
##D # see if we can return without deep copy using Rcpp:
##D 
##D p4 <- p
##D q4 <- q
##D setDecimalCodeInPlace(p4)
##D stopifnot(identical(p4, setDecimalCode(p4)))
##D microbenchmark::microbenchmark(setDecimalCodeInPlace(p), setDecimalCode(p), times = times)
##D microbenchmark::microbenchmark(setDecimalCodeInPlace(q), setDecimalCode(q), times = times)
##D 
##D 
## End(Not run)



