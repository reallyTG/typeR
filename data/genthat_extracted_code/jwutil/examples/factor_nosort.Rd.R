library(jwutil)


### Name: factor_nosort
### Title: Fast Factor Generation
### Aliases: factor_nosort

### ** Examples

## Not run: 
##D pts <- icd:::random_unordered_patients(1e7)
##D u <- unique.default(pts$code)
##D # this shows that stringr (which uses stringi) sort takes 50% longer than
##D # built-in R sort.
##D microbenchmark::microbenchmark(sort(u), str_sort(u))
##D 
##D # this shows that \code{factor_} is about 50% faster than \code{factor} for
##D # big vectors of strings
##D 
##D # without sorting is much faster:
##D microbenchmark::microbenchmark(factor(pts$code),
##D                                # factor_(pts$code),
##D                                factor_nosort(pts$code),
##D                                times = 25)
## End(Not run)



