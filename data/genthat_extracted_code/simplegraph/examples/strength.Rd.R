library(simplegraph)


### Name: strength
### Title: Vertex strength: sum of weights of incident edges
### Aliases: strength

### ** Examples

G <- graph(
  data.frame(
    stringsAsFactors = FALSE,
    id = c("a", "b", "c", "d")
  ),
  data.frame(
    stringsAsFactors = FALSE,
    from   = c("a", "a", "b", "b", "c"),
    to     = c("b", "d", "d", "c", "a"),
    weight = c( 1 ,  2 ,  1 ,  3 ,  2 )
  )
)
strength(G)

G2 <- graph(
  data.frame(
    stringsAsFactors = FALSE,
    id = c("a", "b", "c", "d")
  ),
  data.frame(
    stringsAsFactors = FALSE,
    from   = c("a", "a", "b", "b", "c"),
    to     = c("b", "d", "d", "c", "a")
  )
)
strength(G2)



