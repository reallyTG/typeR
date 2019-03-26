library(potts)


### Name: packPotts
### Title: Transform Potts Model Data
### Aliases: packPotts inspectPotts unpackPotts
### Keywords: misc

### ** Examples

x <- matrix(sample(4, 2 * 3, replace = TRUE), nrow = 2)
x
foo <- packPotts(x, ncolor = 4)
foo
inspectPotts(foo)
unpackPotts(foo)



