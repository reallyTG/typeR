library(triversity)


### Name: tripartite_example
### Title: An example of dataframe encoding a small tripartite graph.
### Aliases: tripartite_example
### Keywords: datasets

### ** Examples

data (tripartite_example)
head (tripartite_example)

# Load the data.frame into a proper data structure
tripartite <- get_tripartite (data=tripartite_example)

# Get the names of the nodes in the second level of the tripartite graph
tripartite$nodes$level2

# Get the transition matrix of a random walk going from the level 2 to level 1
tripartite$transitions$level2$level1$mat



