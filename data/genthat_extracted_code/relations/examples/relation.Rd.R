library(relations)


### Name: relation
### Title: Relations
### Aliases: relation endorelation homorelation as.relation is.relation
###   codual codual.relation sym sym.relation asy asy.relation
### Keywords: math

### ** Examples

require("sets")				# set(), tuple() etc.

## A relation created by specifying the graph:
R <- relation(graph = data.frame(A = c(1, 1:3), B = c(2:4, 4)))
relation_incidence(R)
## extract domain
relation_domain(R)
## extract graph
relation_graph(R)
## both ("a pair of domain and graph" ...)
as.tuple(R)

## (Almost) the same using the set specification
## (the domain labels are missing).
R <- relation(graph = set(tuple(1,2), tuple(1,3),
                          tuple(2,4), tuple(3,4)))
## equivalent to:
## relation(graph = list(c(1,2), c(1,3), c(2,4), c(3,4)))
relation_incidence(R)

## Explicitly specifying the domain:
R <- relation(domain = list(A = letters[1:3], B = LETTERS[1:4]),
              graph = set(tuple("a","B"), tuple("a","C"),
                          tuple("b","D"), tuple("c","D")))
relation_incidence(R)

## Domains can be composed of arbitrary R objects:
R <- relation(domain = set(c, "test"),
              graph = set(tuple(c, c), tuple(c, "test")))
relation_incidence(R)

## Characteristic function ("a divides b"):
R <- relation(domain = list(1 : 10, 1 : 10),
              charfun = function(a, b) b %% a == 0)
relation_incidence(R)
## R is a partial order: plot the Hasse diagram provided that
## Rgraphviz is available:
if(require("Rgraphviz")) plot(R)

## conversions and operators
x <- matrix(0, 3, 3)
R1 <- as.relation(row(x) >= col(x))
R2 <- as.relation(row(x) <= col(x))
R3 <- as.relation(row(x) <  col(x))
relation_incidence(max(R1, R2))
relation_incidence(min(R1, R2))
R3 < R2
relation_incidence(R1 * R2)
relation_incidence(! R1)
relation_incidence(t(R2))

### endorelation
s <- set(pair("a","b"), pair("c","d"))
relation_incidence(relation(graph = s))
relation_incidence(endorelation(graph = s))



