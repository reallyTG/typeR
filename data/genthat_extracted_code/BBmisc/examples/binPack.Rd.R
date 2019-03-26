library(BBmisc)


### Name: binPack
### Title: Simple bin packing.
### Aliases: binPack

### ** Examples

x = 1:10
bp = binPack(x, 11)
xs = split(x, bp)
print(xs)
print(sapply(xs, sum))



