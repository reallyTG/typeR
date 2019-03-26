library(ioanalysis)


### Name: leontief.inv
### Title: Leontief Inverse
### Aliases: leontief.inv

### ** Examples

# Using an "InputOutput" object
data(toy.IO)
class(toy.IO)

L1 <- leontief.inv(toy.IO, region = "Narnia")

# Otherwise
Z <- toy.IO$Z
X <- toy.IO$X
L2 <- leontief.inv(Z, X)



