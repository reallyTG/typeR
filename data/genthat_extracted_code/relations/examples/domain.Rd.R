library(relations)


### Name: domain
### Title: Relation Domain, Arity, and Size
### Aliases: relation_arity relation_domain relation_domain_names
###   relation_size
### Keywords: math

### ** Examples

## A simple relation:
R <- as.relation(c(A = 1, B = 2, C = 3))
relation_incidence(R)
relation_arity(R)
relation_domain(R)
relation_domain_names(R)
relation_size(R)



