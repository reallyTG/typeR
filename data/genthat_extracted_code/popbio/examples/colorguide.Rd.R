library(popbio)


### Name: colorguide
### Title: Plot a simple guide to colors
### Aliases: colorguide
### Keywords: color

### ** Examples

op<-par(mfrow=c(2,2))
colorguide(palette(), "Palette colors")
## 657 built-in colors
## RED
reds<-grep("red", colors(), value=TRUE)
## sorted alphabetically
colorguide(reds, "Reds sorted alphabetically")
# GREEN
greens<-grep("green", colors(), value=TRUE)
RGBColors <- col2rgb(greens)
RGBOrder <- order( RGBColors[2,], RGBColors[3,], RGBColors[1,]  )
colorguide(greens[RGBOrder][1:30], "Greens sorted by RGB")
## light blues
colorguide(grep("light.*blue", colors(), value=TRUE) , "Light blues")
## Functions
colorguide(rainbow(16, end=.7)  , "Rainbow colors")
colorguide(heat.colors(16)  , "Heat.colors")
## colorRampPalette
jet.colors = colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", "#7FFF7F",
  "yellow", "#FF7F00", "red", "#7F0000"))
colorguide(rev(jet.colors(16)), "Jet colors from Matlab")
blue2red<-colorRampPalette(c('blue','lightyellow','red'))
colorguide(blue2red(16), "Blue to Red colors")
par(op)



