library(sets)


### Name: closure
### Title: Closure and reduction
### Aliases: closure closure.set binary_closure reduction reduction.set
###   binary_reduction
### Keywords: math

### ** Examples

## ordinary set
s <- set(set(1),set(2),set(3))
(cl <- closure(s))
(re <- reduction(cl))
stopifnot(s == re)

(cl <- closure(s, "intersection"))
(re <- reduction(cl, "intersection"))
stopifnot(s == re)

## multi set
s <- set(gset(1,1),gset(2,2),gset(3,3))
(cl <- closure(s))
(re <- reduction(cl))
stopifnot(s == re)

## fuzzy set
s <- set(gset(1,1/3),gset(2,2/3),gset(3,3/3))
(cl <- closure(s))
(re <- reduction(cl))
stopifnot(s == re)

## fuzzy multiset
s <- set(gset(1,list(set(1,0.8))), gset(2, list(gset(1,3))), gset(3,0.3))
(cl <- closure(s))
(re <- reduction(cl))
stopifnot(s == re)



