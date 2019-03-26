library(bnlearn)


### Name: plot.bn.strength
### Title: Plot arc strengths derived from bootstrap
### Aliases: plot.bn.strength
### Keywords: plots

### ** Examples

data(learning.test)

start = random.graph(nodes = names(learning.test), num = 50)
netlist = lapply(start, function(net) {
  hc(learning.test, score = "bde", iss = 10, start = net) })
arcs = custom.strength(netlist, nodes = names(learning.test), cpdag = FALSE)
plot(arcs)



