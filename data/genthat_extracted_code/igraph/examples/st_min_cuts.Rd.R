library(igraph)


### Name: st_min_cuts
### Title: List all minimum (s,t)-cuts of a graph
### Aliases: st_min_cuts stMincuts
### Keywords: graphs

### ** Examples


# A difficult graph, from the Provan-Shier paper
g <- graph_from_literal(s --+ a:b, a:b --+ t,
               a --+ 1:2:3:4:5, 1:2:3:4:5 --+ b)
st_min_cuts(g, source="s", target="t")



