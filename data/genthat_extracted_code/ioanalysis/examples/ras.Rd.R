library(ioanalysis)


### Name: ras
### Title: ras Updating Proejcting
### Aliases: ras

### ** Examples

data(toy.IO)
class(toy.IO)

set.seed(117)
growth <- 1 + 0.1 * runif(10)
sort(growth)

X <- toy.IO$X
X1 <- X * growth
U <- rowSums(toy.IO$Z)
U1 <- U * growth
V <- colSums(toy.IO$Z)
V1 <- V * growth

ras <- ras(toy.IO, X1, U1, V1, maxiter = 10, verbose = TRUE)



