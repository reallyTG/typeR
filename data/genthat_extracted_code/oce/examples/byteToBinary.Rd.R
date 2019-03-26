library(oce)


### Name: byteToBinary
### Title: Format bytes as binary [defunct]
### Aliases: byteToBinary

### ** Examples

library(oce)
## Note comparison with rawToBits():
a <- as.raw(0x0a)
byteToBinary(a, "big")        # "00001010"
as.integer(rev(rawToBits(a))) # 0 0 0 0 1 0 1 0



