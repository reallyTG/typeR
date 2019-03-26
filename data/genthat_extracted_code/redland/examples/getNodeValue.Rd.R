library(redland)


### Encoding: UTF-8

### Name: getNodeValue
### Title: Get the value of the node as a string
### Aliases: getNodeValue getNodeValue,Node-method

### ** Examples

world <- new("World")
node <- new("Node", world, literal="¡Hola, amigo! ¿Cómo estás?", language="es")
value <- getNodeValue(node)



