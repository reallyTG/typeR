library(seriation)


### Name: pimage
### Title: Permutation Image Plot
### Aliases: pimage pimage.matrix pimage.dist
### Keywords: hplot

### ** Examples

x <- matrix(sample(c(FALSE, TRUE), 300, rep=TRUE), ncol=10,
  dimnames = list(1:30, LETTERS[1:10]))

## matrix (large values are dark/black)
pimage(x, main = "Random data", key = FALSE)

## plot seriated matrix (use red, proportional display and plot all axes)
pimage(x, seriate(x), col = c("white", "red"),
  prop = TRUE, axes="both", main = "Reordered data", key = FALSE)

## show correlation (for neg. values a diverging color scheme is
## used automatically)
pimage(cor(x), prop=TRUE)

## distances (note that low distances are represented dark!)
d <- dist(x, method = "binary")
pimage(d, upper.tri = FALSE, main = "Distances")

pimage(d, seriate(d), upper.tri = FALSE, main = "Distances", axes = "both")

## add to the plot using grid (use pop = FALSE)
library(grid)
pimage(x, pop = FALSE)
downViewport(name = "image")

## highlight cell 7/5 with a red arrow
grid.lines(x = c(5, 7), y = c(3, 5), arrow = arrow(),
  default.units = "native", gp = gpar(col="red", lwd = 3))

## add a red box around rows 15 and 16
grid.rect(x = 0.5, y = 15.5, width = ncol(x), height = 2,
  just = "left",
  default.units = "native", gp = gpar(col="red", lwd = 3, fill = NA))

## remove the viewports
popViewport(0)

## put several pimages on a page (uses viewports and newpage = FALSE)
library(grid)
grid.newpage()
pushViewport(viewport(layout=grid.layout(nrow = 1, ncol = 2)))
pushViewport(viewport(layout.pos.row = 1, layout.pos.col = 1))

## seriate matrix
o <- seriate(x)
pimage(x, o, main = "Random data", prop = TRUE, axes = "both", key = FALSE,
  newpage = FALSE)

upViewport(1)
pushViewport(viewport(layout.pos.row = 1, layout.pos.col = 2))

## add the reordered disimilarity matrix for rowa
pimage(d, o[[1]], upper.tri = FALSE, main = "Distances", axes = "both",
  key = FALSE, newpage = FALSE)

upViewport(1)
popViewport(0)



