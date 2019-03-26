library(icd)


### Name: factor_nosort_rcpp_worker
### Title: Fast Factor Generation
### Aliases: factor_nosort_rcpp_worker factor_nosort factor_nosort_rcpp
### Keywords: internal manip

### ** Examples

x <- c("z", "a", "123")
icd:::factor_nosort(x)
# should return a factor without modification
x <- as.factor(x)
identical(icd:::factor_nosort(x), x)
# unless the levels change:
icd:::factor_nosort(x, levels = c("a", "z"))

# existing factor levels aren't re-ordered without also moving elements
f <- factor(c("a", "b", "b", "c"))
g <- icd:::factor_nosort(f, levels = c("a", "c", "b"))
stopifnot(g[4] == "c")



