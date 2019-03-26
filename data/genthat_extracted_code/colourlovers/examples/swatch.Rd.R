library(colourlovers)


### Name: swatch
### Title: Extract colors from an object
### Aliases: swatch

### ** Examples

e <- function(e) NULL # function for tryCatch to fail in examples

# get top colors
tryCatch( swatch(clcolors('top')), error = e)

# get colors from a specific palette
tryCatch( swatch(clpalette('113451')), error = e)

# get colors from specific pattern
tryCatch( swatch(clpattern('1451')), error = e)




