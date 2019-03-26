library(seriation)


### Name: color_palettes
### Title: Different Useful Color Palettes
### Aliases: greenred bluered grays greys
### Keywords: hplot

### ** Examples

pimage(rbind(1:100))
pimage(rbind(1:100), col = greys(100, power=2))
pimage(rbind(1:100), col = bluered(100))
pimage(rbind(1:100), col = bluered(100, bias = 2))
pimage(rbind(-100:100), col = greenred(10))

## create your own color palettes 
## red to green (with 10 colors)
pimage(rbind(1:100), 
  col = colorRampPalette(colors = c("red", "yellow", "green"))(10))
## white to blue (with 100 colors)
pimage(rbind(1:100), 
  col = colorRampPalette(colors = c("white", "blue"))(100))



