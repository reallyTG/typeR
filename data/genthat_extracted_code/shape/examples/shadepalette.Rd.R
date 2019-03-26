library(shape)


### Name: shadepalette
### Title: color palette inbetween two extremes
### Aliases: shadepalette
### Keywords: color

### ** Examples

shadepalette(n = 10, "white", "black")
image(matrix(nrow = 1, ncol = 100, data = 1:100),
      col = shadepalette(100, "red", "blue"), main = "shadepalette")



