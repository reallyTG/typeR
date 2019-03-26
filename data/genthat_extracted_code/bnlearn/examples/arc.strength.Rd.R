library(bnlearn)


### Name: arc.strength
### Title: Measure arc strength
### Aliases: arc.strength boot.strength custom.strength bf.strength
###   averaged.network mean.bn.strength
### Keywords: network scores independence tests structure learning

### ** Examples

data(learning.test)
res = gs(learning.test)
res = set.arc(res, "A", "B")
arc.strength(res, learning.test)

## Not run: 
##D arcs = boot.strength(learning.test, algorithm = "hc")
##D arcs[(arcs$strength > 0.85) & (arcs$direction >= 0.5), ]
##D averaged.network(arcs)
##D 
##D start = random.graph(nodes = names(learning.test), num = 50)
##D netlist = lapply(start, function(net) {
##D   hc(learning.test, score = "bde", iss = 10, start = net) })
##D arcs = custom.strength(netlist, nodes = names(learning.test),
##D          cpdag = FALSE)
##D arcs[(arcs$strength > 0.85) & (arcs$direction >= 0.5), ]
##D modelstring(averaged.network(arcs))
## End(Not run)

bf.strength(res, learning.test, score = "bds", prior = "marginal")



