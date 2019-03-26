library(permutations)


### Name: fbin
### Title: The fundamental bijection
### Aliases: fbin fbin_single fbin_inv standard standard_cyclist

### ** Examples


# Stanley's example w:
standard(cycle(list(list(c(1,4),c(3,7,5)))))

w_hat <- c(2,4,1,6,7,5,3)

fbin(w_hat)
fbin_inv(fbin(w_hat))


x <- rperm(40,9)
stopifnot(all(fbin(fbin_inv(x))==x))
stopifnot(all(fbin_inv(fbin(x))==x))




