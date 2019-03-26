library(ruta)


### Name: plot.ruta_network
### Title: Draw a neural network
### Aliases: plot.ruta_network

### ** Examples

net <-
  input() +
  dense(1000, "relu") + dropout() +
  dense(100, "tanh") +
  dense(1000, "relu") + dropout() +
  output("sigmoid")
plot(net, log = TRUE, fg = "#30707a", bg = "#e0e6ea")



