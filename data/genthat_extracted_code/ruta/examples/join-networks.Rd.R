library(ruta)


### Name: +.ruta_network
### Title: Add layers to a network/Join networks
### Aliases: +.ruta_network c.ruta_network

### ** Examples

network <- input() + dense(30) + output("sigmoid")
another <- c(input(), dense(30), dense(3), dense(30), output())



