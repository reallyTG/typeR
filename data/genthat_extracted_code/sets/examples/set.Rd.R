library(sets)


### Name: set
### Title: Sets
### Aliases: set as.set make_set_with_order is.set set_is_empty
###   set_is_subset set_is_proper_subset set_is_equal set_contains_element
###   set_union set_intersection set_symdiff set_complement set_cardinality
###   length.set lengths.set set_power set_cartesian set_combn
### Keywords: math

### ** Examples

## constructor
s <- set(1L, 2L, 3L)
s

## named elements
snamed <- set(one = 1, 2, three = 3)
snamed

## indexing by label
snamed[["one"]]

## subassignment
snamed[c(2,3)] <- c("a","b")
snamed

## a more complex set
set(c, "test", list(1, 2, 3))

## converter
s2 <- as.set(2:5)
s2

## converter with order
make_set_with_order(5:1)

## set of sets
set(set(), set(1))

## cartesian product
s * s2
s * s
s ^ 2 # same as above
s ^ 3

## power set
2 ^ s

## tuples
s3 <- set(tuple(1,2,3), tuple(2,3,4))
s3

## Predicates:

## element
1:2 %e% s
tuple(1,2,3) %e% s3

## subset
s <= s2
s2 >= s # same

## proper subset
s < s

## complement, union, intersection, symmetric difference:
s - 1L
s + set("a") # or use: s | set("a")
s & s
s %D% s2
set(1,2,3) - set(1,2)
set_intersection(set(1,2,3), set(2,3,4), set(3,4,5))
set_union(set(1,2,3), set(2,3,4), set(3,4,5))
set_symdiff(set(1,2,3), set(2,3,4), set(3,4,5))

## subsets:
set_combn(as.set(1:3),2)

## iterators:
sapply(s, sqrt)
for (i in s) print(i)

## Summary methods
sum(s)
range(s)

## mean / median
mean(s)
median(s)

## cardinality
s <- set(1, list(1, 2))
length(s)
lengths(s)



