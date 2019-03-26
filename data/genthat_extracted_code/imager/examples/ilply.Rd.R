library(imager)


### Name: ilply
### Title: Split an image along axis, apply function, return a list
### Aliases: ilply

### ** Examples

parrots <- load.example("parrots")
ilply(parrots,"c",mean) #mean luminance per colour channel



