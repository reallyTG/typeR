library(relations)


### Name: predicates
### Title: Relation Predicates
### Aliases: predicates relation_is relation_is_Euclidean
###   relation_is_Ferrers relation_is_acyclic relation_is_antisymmetric
###   relation_is_asymmetric relation_is_bijective relation_is_binary
###   relation_is_complete relation_is_coreflexive relation_is_crisp
###   relation_is_cyclic relation_is_endorelation relation_is_equivalence
###   relation_is_functional relation_is_homogeneous relation_is_injective
###   relation_is_interval_order relation_is_irreflexive
###   relation_is_left_total relation_is_linear_order relation_is_match
###   relation_is_negatively_transitive relation_is_partial_order
###   relation_is_preference relation_is_preorder relation_is_quasiorder
###   relation_is_quasitransitive relation_is_quaternary
###   relation_is_reflexive relation_is_right_total relation_is_semiorder
###   relation_is_semitransitive relation_is_strict_linear_order
###   relation_is_strict_partial_order relation_is_strongly_complete
###   relation_is_surjective relation_is_symmetric relation_is_ternary
###   relation_is_tournament relation_is_transitive
###   relation_is_trichotomous relation_is_weak_order relation_has_missings
### Keywords: math

### ** Examples

require("sets")
R <- relation(domain = c(1, 2, 3), graph = set(c(1, 2), c(2, 3)))
summary(R)

## Note the possible effects of NA-handling:
relation_incidence(R)
relation_is(R, "transitive") ## clearly FALSE

relation_incidence(R)[1, 2] <- NA
relation_incidence(R)
relation_is(R, "transitive") ## clearly NA

## The following gives TRUE, since NA gets replaced with 0:
relation_is(R, "transitive", na.rm = TRUE)



