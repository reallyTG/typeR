library(bitops)


### Name: bitFlip
### Title: Binary Flip (Not) Operator
### Aliases: bitFlip
### Keywords: arith utilities

### ** Examples

 stopifnot(
  bitFlip(-1) == 0,
  bitFlip(0 ) == 2^32 - 1,
  bitFlip(0, bitWidth=8) == 255
 )



