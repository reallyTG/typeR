library(sets)


### Name: gset
### Title: Generalized sets
### Aliases: gset as.gset is.gset gset_is_empty gset_is_subset
###   gset_is_proper_subset gset_is_equal gset_contains_element gset_union
###   gset_sum gset_product gset_mean gset_difference gset_intersection
###   gset_symdiff gset_complement gset_power gset_cartesian gset_combn
###   gset_core gset_peak gset_height gset_transform_memberships
###   gset_concentrate gset_dilate gset_normalize gset_defuzzify %D% %e% e
###   is_element gset_bound gset_cardinality gset_charfun gset_memberships
###   gset_support gset_universe gset_has_missings gset_is_crisp
###   gset_is_fuzzy_set gset_is_multiset gset_is_set_or_fuzzy_set
###   gset_is_set_or_multiset gset_is_fuzzy_multiset gset_is_set
###   length.gset lengths.gset mean.gset median.gset cut.gset
### Keywords: math

### ** Examples

## multisets
(A <- gset(letters[1:5], memberships = c(3, 2, 1, 1, 1)))
(B <- gset(c("a", "c", "e", "f"), memberships = c(2, 2, 1, 2)))
rep(B, 2)
gset_memberships(tuple(A, B), c("a","c"))

gset_union(A, B)
gset_intersection(A, B)
gset_complement(A, B)

gset_is_multiset(A)
gset_sum(A, B)
gset_difference(A, B)

## fuzzy sets
(A <- gset(letters[1:5], memberships = c(1, 0.3, 0.8, 0.6, 0.2)))
(B <- gset(c("a", "c", "e", "f"), memberships = c(0.7, 1, 0.4, 0.9)))
cut(B, 0.5)
A * B
A <- gset(3L, memberships = 0.5, universe = 1:5)
!A

## fuzzy multisets
(A <- gset(c("a", "b", "d"),
         memberships = list(c(0.3, 1, 0.5), c(0.9, 0.1),
                            gset(c(0.4, 0.7), c(1, 2)))))
(B <- gset(c("a", "c", "d", "e"),
         memberships = list(c(0.6, 0.7), c(1, 0.3), c(0.4, 0.5), 0.9)))
gset_union(A, B)
gset_intersection(A, B)
gset_complement(A, B)

## other operations
mean(gset(1:3, c(0.1,0.5,0.9)))
median(gset(1:3, c(0.1,0.5,0.9)))



