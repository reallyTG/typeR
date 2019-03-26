library(igraph)


### Name: st_cuts
### Title: List all (s,t)-cuts of a graph
### Aliases: st_cuts stCuts
### Keywords: graphs

### ** Examples


# A very simple graph
g <- graph_from_literal(a -+ b -+ c -+ d -+ e)
st_cuts(g, source="a", target="e")

# A somewhat more difficult graph
g2 <- graph_from_literal(s --+ a:b, a:b --+ t,
                   a --+ 1:2:3, 1:2:3 --+ b)
st_cuts(g2, source="s", target="t")



