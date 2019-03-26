library(sitmo)


### Name: sitmo_two_seeds
### Title: Two RNG engines running side-by-side
### Aliases: sitmo_two_seeds

### ** Examples

n = 10
a = sitmo_two_seeds(n, c(1337, 1338))

b = sitmo_two_seeds(n, c(1337, 1337))

isTRUE(all.equal(a[,1], a[,2]))

isTRUE(all.equal(b[,1], b[,2]))

isTRUE(all.equal(a[,1], b[,1]))



