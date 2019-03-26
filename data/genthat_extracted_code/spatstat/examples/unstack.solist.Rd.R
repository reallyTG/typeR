library(spatstat)


### Name: unstack.solist
### Title: Unstack Each Spatial Object in a List of Objects
### Aliases: unstack.solist unstack.layered
### Keywords: spatial manip

### ** Examples

  A <- solist(finpines=finpines, cells=cells)
  A
  unstack(A)
  B <- layered(fin=finpines, loc=unmark(finpines),
              plotargs=list(list(), list(pch=16)))
  B
  plot(B)
  unstack(B)
  plot(unstack(B))



