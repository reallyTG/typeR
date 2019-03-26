library(dichromat)


### Name: colorschemes
### Title: Color Schemes
### Aliases: colorschemes
### Keywords: datasets

### ** Examples

pal <- function(col, ...)
  image(seq_along(col), 1, matrix(seq_along(col), ncol = 1),
  col = col, axes = FALSE, ...)

opar <- par(mar = c(1, 2, 1, 1))
layout(matrix(1:6, ncol = 1))
pal(colorschemes$BrowntoBlue.10, main = "Brown to Blue (10)")
pal(colorRampPalette(colorschemes$BrowntoBlue.10, space = "Lab")(100),
  main = "Brown to Blue Ramp")
pal(dichromat(colorschemes$BrowntoBlue.10),
  main = "Brown to Blue (10) -- deuteranopia")
pal(colorschemes$Categorical.12, main = "Categorical (12)")
pal(dichromat(colorschemes$Categorical.12),
  main = "Categorical (12) -- deuteranopia")
pal(dichromat(colorschemes$Categorical.12, "protan"),
  main = "Categorical (12) -- protanopia")
par(opar)



