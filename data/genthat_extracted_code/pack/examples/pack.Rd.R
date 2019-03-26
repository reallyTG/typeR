library(pack)


### Name: pack
### Title: Pack raw vectors
### Aliases: pack
### Keywords: utilities

### ** Examples

  (x <- pack('A4 C v A8 V', 'pack', 2, 8, 'sequence', 68098))
  (u1 <- unpack('A4 C H*', x))
  (u2 <- unpack('v/A V', u1[[3]]))



