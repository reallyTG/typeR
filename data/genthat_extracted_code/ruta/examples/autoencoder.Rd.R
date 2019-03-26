library(ruta)


### Name: autoencoder
### Title: Create an autoencoder learner
### Aliases: autoencoder

### ** Examples


# Basic autoencoder with a network of [input]-256-36-256-[input] and
# no nonlinearities
autoencoder(c(256, 36), loss = "binary_crossentropy")

# Customizing the activation functions in the same network
network <-
  input() +
  dense(256, "relu") +
  dense(36, "tanh") +
  dense(256, "relu") +
  output("sigmoid")

learner <- autoencoder(
  network,
  loss = "binary_crossentropy"
)




