library(ggdag)


### Name: coordinates
### Title: Manipulate DAG coordinates
### Aliases: coordinates coords2df coords2list

### ** Examples

library(dagitty)
coords <- list(
  x = c(A = 1, B = 2, D = 3, C = 3, F = 3, E = 4, G = 5, H = 5, I = 5),
  y = c(A = 0, B = 0, D = 1, C = 0, F = -1, E = 0, G = 1, H = 0, I = -1)
)
coord_df <- coords2df(coords)
coords2list(coord_df)

x <- dagitty('dag{
             G <-> H <-> I <-> G
             D <- B -> C -> I <- F <- B <- A
             H <- E <- C -> G <- D
             }')
coordinates(x) <- coords2list(coord_df)




