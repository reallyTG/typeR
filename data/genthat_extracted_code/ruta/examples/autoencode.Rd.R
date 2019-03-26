library(ruta)


### Name: autoencode
### Title: Automatically compute an encoding of a data matrix
### Aliases: autoencode

### ** Examples

inputs <- as.matrix(iris[, 1:4])

## No test: 
# Train a basic autoencoder and generate a 2-variable encoding
encoded <- autoencode(inputs, 2)

# Train a contractive autoencoder with tanh activation
encoded <- autoencode(inputs, 2, type = "contractive", activation = "tanh")
## End(No test)



