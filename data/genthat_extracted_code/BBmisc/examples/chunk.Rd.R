library(BBmisc)


### Name: chunk
### Title: Chunk elements of vectors into blocks of nearly equal size.
### Aliases: chunk

### ** Examples

xs = 1:10
chunk(xs, chunk.size = 3)
chunk(xs, n.chunks = 2)
chunk(xs, n.chunks = 2, shuffle = TRUE)
chunk(xs, props = c(7, 3))



