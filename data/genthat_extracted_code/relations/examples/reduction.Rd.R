library(relations)


### Name: reduction
### Title: Transitive and Reflexive Reduction
### Aliases: transitive_reduction reflexive_reduction reduction.relation
### Keywords: math

### ** Examples

R <- as.relation(1 : 5)
relation_incidence(R)

## transitive closure/reduction
RR <- transitive_reduction(R)
relation_incidence(RR)
R == transitive_closure(RR)

## same
require("sets")				# closure() and reduction() etc.
R == closure(reduction(R))

## reflexive closure/reduction

RR <- reflexive_reduction(R)
relation_incidence(RR)
R == reflexive_closure(RR)

## same:
R == closure(reduction(R, "reflexive"), "reflexive")

## transitive reduction of a cyclic relation:
## (example from La Poutre and van Leeuwen)

require("sets")				# set(), pair() etc.
if(require("Rgraphviz")) {
  G <- set(pair(1L, 2L), pair(2L, 1L), pair(1L, 3L), pair(3L, 1L),
           pair(3L, 7L), pair(2L, 5L), pair(2L, 6L), pair(6L, 5L),
           pair(5L, 7L), pair(4L, 6L), pair(5L, 4L), pair(4L, 7L))
  R <- endorelation(graph = G)
  plot(relation_ensemble(R, R), type = c("raw", "simplified"), main =
           c("original graph", "transitive reduction"))
  }



