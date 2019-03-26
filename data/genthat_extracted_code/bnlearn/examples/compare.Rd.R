library(bnlearn)


### Name: compare
### Title: Compare two or more different Bayesian networks
### Aliases: compare all.equal.bn shd hamming graphviz.compare
### Keywords: graphs plots interfaces to other packages

### ** Examples

data(learning.test)

e1 = model2network("[A][B][C|A:B][D|B][E|C][F|A:E]")
e2 = model2network("[A][B][C|A:B][D|B][E|C:F][F|A]")
shd(e2, e1, debug = TRUE)
unlist(compare(e1,e2))
compare(target = e1, current = e2, arcs = TRUE)
graphviz.compare(e1, e2, diff = "none")



