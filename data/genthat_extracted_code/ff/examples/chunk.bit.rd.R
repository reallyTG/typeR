library(ff)


### Name: chunk.bit
### Title: Chunk bit vectors
### Aliases: chunk.bit
### Keywords: IO data

### ** Examples

  n <- 1000
  x <- bit(n)
  ceiling(n / (300 %/% sum(.rambytes["logical"])))
  chunk(x, BATCHBYTES=300)
  ceiling((n/2) / (100 %/% sum(.rambytes["logical"])))
  chunk(x, from=1, to = n/2, BATCHBYTES=100)
  rm(x, n)




