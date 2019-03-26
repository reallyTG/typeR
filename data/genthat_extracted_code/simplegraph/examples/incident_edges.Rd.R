library(simplegraph)


### Name: incident_edges
### Title: Incident edges
### Aliases: incident_edges

### ** Examples

G <- graph(list(A = c("B", "C"), B = "C", C = "A"))
incident_edges(G, mode = "out")
incident_edges(G, mode = "in")
incident_edges(G, mode = "all")



