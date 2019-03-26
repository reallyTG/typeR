library(igraph)


### Name: is_chordal
### Title: Chordality of a graph
### Aliases: is_chordal is.chordal
### Keywords: graphs

### ** Examples


## The examples from the Tarjan-Yannakakis paper
g1 <- graph_from_literal(A-B:C:I, B-A:C:D, C-A:B:E:H, D-B:E:F,
                E-C:D:F:H, F-D:E:G, G-F:H, H-C:E:G:I,
                I-A:H)
max_cardinality(g1)
is_chordal(g1, fillin=TRUE)

g2 <- graph_from_literal(A-B:E, B-A:E:F:D, C-E:D:G, D-B:F:E:C:G,
                E-A:B:C:D:F, F-B:D:E, G-C:D:H:I, H-G:I:J,
                I-G:H:J, J-H:I)
max_cardinality(g2)
is_chordal(g2, fillin=TRUE)




