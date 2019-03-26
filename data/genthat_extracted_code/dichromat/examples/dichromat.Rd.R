library(dichromat)


### Name: dichromat
### Title: Remove Red-Green or Green-Blue Contrasts from Colors
### Aliases: dichromat
### Keywords: color

### ** Examples

## from example(pie)
 par(mfrow = c(2, 2))
 pie.sales <- c(0.12, 0.3, 0.26, 0.16, 0.04, 0.12)
 names(pie.sales) <- c("Blueberry", "Cherry",
   "Apple", "Boston Cream", "Other", "Vanilla Cream")
 pie(pie.sales, # default colors
   col = c("white", "lightblue", "mistyrose", "lightcyan", "lavender", "cornsilk"))
 pie(pie.sales,
   col = c("purple", "violetred1", "green3", "cornsilk", "cyan", "white"))
 pie(pie.sales, col = dichromat(
   c("white", "lightblue", "mistyrose", "lightcyan", "lavender", "cornsilk")))
 pie(pie.sales, col = dichromat(
   c("purple", "violetred1", "green3", "cornsilk", "cyan", "white")))


## standard color schemes
pie(rep(1,10), col = heat.colors(10))
pie(rep(1,10), col = dichromat(heat.colors(10)))
pie(rep(1,8),  col = palette())
pie(rep(1,8),  col = dichromat(palette()))

pie(rep(1,15), col = topo.colors(15))
pie(rep(1,15), col = dichromat(topo.colors(15)))
pie(rep(1,15), col = terrain.colors(15))
pie(rep(1,15), col = dichromat(terrain.colors(15)))

pie(rep(1,15), col = cm.colors(15))
pie(rep(1,15), col = dichromat(cm.colors(15)))

## color ramp schemes
bluescale <- colorRampPalette(c("#FFFFCC", "#C7E9B4", "#7FCDBB",
  "#40B6C4", "#2C7FB8" , "#253494"))
redgreen <- colorRampPalette(c("red", "green3"))
pie(rep(1,15), col = bluescale(15))
pie(rep(1,15), col = dichromat(bluescale(15)))

par(mfrow = c(2, 4))
x <- matrix(rnorm(10 * 10), 10)
image(1:10, 1:10, x, col = bluescale(10), main = "blue-yellow scale")
image(1:10, 1:10, x, col = dichromat(bluescale(10), "deutan"), main = "deutan")
image(1:10, 1:10, x, col = dichromat(bluescale(10), "protan"), main = "protan")
image(1:10, 1:10, x, col = dichromat(bluescale(10), "tritan"), main = "tritan")

image(1:10, 1:10, x, col = redgreen(10), main = "red-green scale")
image(1:10, 1:10, x, col = dichromat(redgreen(10), "deutan"), main = "deutan")
image(1:10, 1:10, x, col = dichromat(redgreen(10), "protan"), main = "protan")
image(1:10, 1:10, x, col = dichromat(redgreen(10), "tritan"), main = "tritan")



