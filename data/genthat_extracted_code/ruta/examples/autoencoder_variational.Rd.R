library(ruta)


### Name: autoencoder_variational
### Title: Build a variational autoencoder
### Aliases: autoencoder_variational

### ** Examples

network <-
  input() +
  dense(256, "elu") +
  variational_block(3) +
  dense(256, "elu") +
  output("sigmoid")

learner <- autoencoder_variational(network, loss = "binary_crossentropy")



