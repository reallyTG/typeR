library(pomdp)


### Name: plot
### Title: Visualize a POMDP Policy Graph
### Aliases: plot.POMDP plot
### Keywords: hplot

### ** Examples

data("TigerProblem")
tiger_solved <- solve_POMDP(model = TigerProblem)
tiger_solved

## policy graph
policy_graph(tiger_solved)

## visualization
plot(tiger_solved)

library(igraph)

## use a different graph layout
plot(tiger_solved, layout = layout_with_mds)

## hide edge labels
plot(tiger_solved, edge.label = NA)

## custom larger vertex labels (A, B, ...)
plot(tiger_solved, 
  vertex.label = LETTERS[1:nrow(solution(tiger_solved)$pg)], 
  vertex.label.cex = 2,
  vertex.label.color = "white")

## add a plot title
plot(tiger_solved, main = model(tiger_solved)$name)



