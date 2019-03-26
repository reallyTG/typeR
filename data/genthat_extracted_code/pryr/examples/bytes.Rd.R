library(pryr)


### Name: bytes
### Title: Print the byte-wise representation of a value
### Aliases: bytes bits

### ** Examples

## Encoding doesn't change the internal bytes used to represent characters;
## it just changes how they are interpretted!

x <- y <- z <- "\u9b3c"
Encoding(y) <- "bytes"
Encoding(z) <- "latin1"
print(x); print(y); print(z)
bytes(x); bytes(y); bytes(z)
bits(x); bits(y); bits(z)

## In R, integers are signed ints. The first bit indicates the sign, but
## values are stored in a two's complement representation. We see that
## NA_integer_ is really just the smallest negative integer that can be
## stored in 4 bytes
bits(NA_integer_)

## There are multiple kinds of NAs, NaNs for real numbers
## (at least, on 64bit architectures)
print( c(NA_real_, NA_real_ + 1) )
rbind( bytes(NA_real_), bytes(NA_real_ + 1) )
rbind( bytes(NaN), bytes(0/0) )



