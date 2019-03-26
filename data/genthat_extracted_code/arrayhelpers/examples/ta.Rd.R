library(arrayhelpers)


### Name: ta
### Title: Transpose arrays
### Aliases: ta

### ** Examples

a <- array (1 : 24, 4:2)
a
ta (a)

setMethod ("t", "array", ta)
t (a)
removeMethod ("t", "array")




