library(relations)


### Name: closure
### Title: Transitive and Reflexive Closure
### Aliases: transitive_closure reflexive_closure closure.relation
### Keywords: math

### ** Examples

R <- as.relation(1 : 5)
relation_incidence(R)

## transitive closure/reduction
RR <- transitive_reduction(R)
relation_incidence(RR)
R == transitive_closure(RR)

## same
require("sets")				# closure() and reduction()
R == closure(reduction(R))

## reflexive closure/reduction

RR <- reflexive_reduction(R)
relation_incidence(RR)
R == reflexive_closure(RR)
## same:
R == closure(reduction(R, "reflexive"), "reflexive")



