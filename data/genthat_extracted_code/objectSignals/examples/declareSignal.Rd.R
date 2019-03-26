library(objectSignals)


### Name: declareSignal
### Title: Declaring a signal field
### Aliases: declareSignal

### ** Examples
setRefClass("Dataset", fields = c(elements = "list",
declareSignal(elementsChanged(which))))


