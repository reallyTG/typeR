library(tagcloud)


### Name: smoothPalette
### Title: Replace a vector of numbers by a gradient of colors
### Aliases: smoothPalette
### Keywords: mapping palette

### ** Examples

smoothPalette( 1:3 )
# will print:
# "#CCCCCC" "#666666" "#000000"

smoothPalette( 1:3, pal= "Blues" )
# will produce:
# "#F7FBFF" "#6BAED6" "#08306B"

x <- runif( 100 )
plot( 1:100, x, col= smoothPalette( x, pal= "BrBG" ), pch= 19 )



