library(bnlearn)


### Name: graph generation utilities
### Title: Generate empty or random graphs
### Aliases: 'graph generation utilities' empty.graph random.graph
### Keywords: simulation

### ** Examples

empty.graph(LETTERS[1:8])
random.graph(LETTERS[1:8])
plot(random.graph(LETTERS[1:8], method = "ic-dag", max.in.degree = 2))
plot(random.graph(LETTERS[1:8]))
plot(random.graph(LETTERS[1:8], prob = 0.2))



