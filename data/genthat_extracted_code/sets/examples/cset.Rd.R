library(sets)


### Name: cset
### Title: Customizable sets
### Aliases: cset as.cset is.cset cset_is_empty cset_is_subset
###   cset_is_proper_subset cset_is_equal cset_contains_element cset_core
###   cset_peak cset_universe cset_bound cset_height cset_union cset_sum
###   cset_difference cset_product cset_mean cset_intersection cset_symdiff
###   cset_complement cset_power cset_cartesian cset_combn cset_cardinality
###   cset_charfun cset_memberships cset_transform_memberships
###   cset_concentrate cset_dilate cset_normalize cset_defuzzify
###   cset_support cset_is_crisp cset_is_fuzzy_set cset_is_multiset
###   cset_is_set_or_fuzzy_set cset_is_set_or_multiset
###   cset_is_fuzzy_multiset cset_is_set cset_has_missings length.cset
###   lengths.cset matchfun mean.cset median.cset cut.cset cset_orderfun
###   cset_matchfun cset_orderfun<- cset_matchfun<-
### Keywords: math

### ** Examples

## default behavior of sets: matching of elements is very strict
## Note that on most systems, 3.3 - 2.2 != 1.1
x <- set("1", 1L, 1, 3.3 - 2.2, 1.1)
print(x)

y <- set(1, 1.1, 2L, "2")
print(y)
1L %e% y

set_union(x, y)
set_intersection(x, y)
set_complement(x, y)

## Now use the more sloppy match()-function. 
## Note that 1 == "1" == 1L ...
X <- cset(x, matchfun = match)
print(X)
Y <- cset(y, matchfun = match)
print(Y)
1L %e% Y

cset_union(X, Y)
cset_intersection(X, Y)
cset_complement(X, Y)

## Same using all.equal().
## This is a non-vectorized predicate, so use matchfun
## to generate a vectorized version:
FUN <- matchfun(function(x, y) isTRUE(all.equal(x, y)))
X <- cset(x, matchfun = FUN)
print(X)
Y <- cset(y, matchfun = FUN)
print(Y)
1L %e% Y

cset_union(X, Y)
cset_intersection(X, Y)
cset_complement(X, Y)

### change default functions via set_option
sets_options("matchfun", match)
cset(x)
cset(y)

cset(1:3) <= cset(c(1,2,3))

### restore package defaults
sets_options("matchfun", NULL)

### customized order function
FUN <- function(x) order(as.character(x), decreasing = TRUE)
Z <- cset(letters[1:5], orderfun = FUN)
print(Z)
as.character(Z)

## converter for ordered factors keeps order
o <- ordered(c("a", "b", "a"), levels = c("b", "a"))
as.set(o)
as.cset(o)

## converter for other data types keep order if the elements are unique:
as.cset(c("A", "quick", "brown", "fox"))
as.cset(c("A", "quick", "brown", "fox", "quick"))



