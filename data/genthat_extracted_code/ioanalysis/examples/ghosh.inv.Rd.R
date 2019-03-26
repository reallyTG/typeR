library(ioanalysis)


### Name: ghosh.inv
### Title: Ghoshian Inverse
### Aliases: ghosh.inv

### ** Examples

# Using an "InputOutput" object
data(toy.IO)
class(toy.IO)

G1 <- ghosh.inv(toy.IO, region = "Narnia")

# Otherwise
Z <- toy.IO$Z
X <- toy.IO$X
G3 <- ghosh.inv(Z, X)



