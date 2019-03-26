library(pack)


### Name: unpack
### Title: Unpack raw vectors
### Aliases: unpack
### Keywords: utilities

### ** Examples

  (x <- pack('A4 C v A8 V', 'pack', 2, 8, 'sequence', 68098))
  (u1 <- unpack('A4 C H*', x))
  (u2 <- unpack('v/A V', u1[[3]]))



