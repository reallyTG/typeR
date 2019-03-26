library(cultevo)


### Name: temperature.colors
### Title: Create a vector of 'temperature' colors (from blue over white to
###   red).
### Aliases: temperature.colors

### ** Examples

# full intensity
image(as.matrix(1:7), z=as.matrix(1:7), col=temperature.colors(7))
# half intensity
image(as.matrix(1:7), z=as.matrix(1:7), col=temperature.colors(7, intensity=0.5))
# skewed palette with more negative than positive temperature colors
image(as.matrix(1:7), z=as.matrix(1:7), col=temperature.colors(-4, 2))



