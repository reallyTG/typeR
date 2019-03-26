library(relations)


### Name: violations
### Title: Violations of Relation Properties
### Aliases: relation_violations
### Keywords: math

### ** Examples

## partial order:
R <- as.relation(1:3)
relation_incidence(R)
## R clearly is transitive, but not symmetric:
relation_violations(R, "transitive")
relation_violations(R, "symmetric")
## Pairs for which symmetry is violated:
relation_violations(R, "symmetric", TRUE)

## create a simple relation:
require("sets")				# set(), pair() etc.
R <- relation(domain = letters[1:2],
              graph = set(pair("a","b"), pair("b","a")))
relation_incidence(R)
## R is clearly symmetric, but not antisymmetric:
relation_violations(R, "symmetric")
relation_violations(R, "antisymmetric")



