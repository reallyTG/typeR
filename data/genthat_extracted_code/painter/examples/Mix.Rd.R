library(painter)


### Name: Mix
### Title: Create mixtures of color pairs, in either RGB or HSV mode.
### Aliases: Mix
### Keywords: color

### ** Examples

TestPalette(Mix("Red","Yellow"))

TestPalette(c("Red",Mix("Red","Yellow"),"Yellow"))
TestPalette(c("salmon",Mix("salmon","turquoise"),"turquoise"))
TestPalette(c("salmon",Mix("salmon","turquoise",mode = "HSV"),"turquoise"))
TestPalette(Mix(rainbow(10),terrain.colors(10)))



