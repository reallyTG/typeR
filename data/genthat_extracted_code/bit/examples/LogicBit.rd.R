library(bit)


### Name: LogicBit
### Title: Boolean operators and functions for class bit
### Aliases: LogicBit !.bit !.bitwhich &.bit &.bitwhich |.bit |.bitwhich
###   ==.bit ==.bitwhich !=.bit !=.bitwhich xor xor.default xor.bit
###   xor.bitwhich
### Keywords: classes logic

### ** Examples

  x <- as.bit(c(FALSE, FALSE, FALSE, NA, NA, NA, TRUE, TRUE, TRUE))
  yl <- c(FALSE, NA, TRUE, FALSE, NA, TRUE, FALSE, NA, TRUE)
  y <- as.bit(yl)
  !x
  x & y
  x | y
  xor(x, y)
  x != y
  x == y
  x & yl
  x | yl
  xor(x, yl)
  x != yl
  x == yl

  x <- as.bitwhich(c(FALSE, FALSE, FALSE, NA, NA, NA, TRUE, TRUE, TRUE))
  yl <- c(FALSE, NA, TRUE, FALSE, NA, TRUE, FALSE, NA, TRUE)
  y <- as.bitwhich(yl)
  !x
  x & y
  x | y
  xor(x, y)
  x != y
  x == y
  x & yl
  x | yl
  xor(x, yl)
  x != yl
  x == yl



