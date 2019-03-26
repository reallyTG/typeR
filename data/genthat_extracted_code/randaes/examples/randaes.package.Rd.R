library(randaes)


### Name: randaes-package
### Title: Random number generator based on AES cipher.
### Aliases: randaes-package randaes
### Keywords: package

### ** Examples

RNGkind("user")
set.seed(42)
runif(10)

## generates random integers in blocks of 4
.C("fortuna_ints", as.integer(6), integer(6))



