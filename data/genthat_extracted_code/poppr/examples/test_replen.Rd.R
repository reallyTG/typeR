library(poppr)


### Name: test_replen
### Title: Test repeat length consistency.
### Aliases: test_replen

### ** Examples

data(Pram)
(Pram_replen <- setNames(c(3, 2, 4, 4, 4), locNames(Pram)))
test_replen(Pram, Pram_replen)



