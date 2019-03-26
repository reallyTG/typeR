library(spatstat)


### Name: Extract.layered
### Title: Extract or Replace Subset of a Layered Object
### Aliases: [.layered [<-.layered [[<-.layered
### Keywords: spatial manip

### ** Examples

 D <- distmap(cells)
 L <- layered(D, cells,
              plotargs=list(list(ribbon=FALSE), list(pch=16)))

 L[-2]
 L[, square(0.5)]

 L[[3]] <- japanesepines
 L



