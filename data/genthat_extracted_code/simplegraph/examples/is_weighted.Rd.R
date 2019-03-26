library(simplegraph)


### Name: is_weighted
### Title: Is the graph weighted?
### Aliases: is_weighted

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
is_weighted(G)

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
is_weighted(G2)



