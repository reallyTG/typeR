library(roloc)


### Name: colourName
### Title: Convert a colour specification to a colour name
### Aliases: colourName colorName colourNames colourNames.default
###   colourNames.colourMatch colorNames
### Keywords: dplot

### ** Examples

# Some colours() are identical to each other
newColours <- colourName(rgb(t(col2rgb(colours())), maxColorValue=255))
repeats <- newColours != colours()
cbind(colours()[repeats], newColours[repeats])



