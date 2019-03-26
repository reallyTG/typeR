library(rsm)


### Name: contour.lm
### Title: Surface plot(s) of a fitted linear model
### Aliases: contour.lm image.lm persp.lm
### Keywords: regression hplot

### ** Examples

### Basic example with a linear model:
mpg.lm <- lm(mpg ~ poly(hp, disp, degree = 3), data = mtcars)
contour(mpg.lm, hp ~ disp, image = TRUE)

### Extended example with an rsm model...
heli.rsm <- rsm (ave ~ block + SO(x1, x2, x3, x4), data = heli)

# Plain contour plots
par (mfrow = c(2,3))
contour (heli.rsm, ~x1+x2+x3+x4, at = xs(heli.rsm))

# Same but with image overlay, slices at origin and block 2,
# and no slice labeling
contour (heli.rsm, ~x1+x2+x3+x4, at = list(block="2"), 
    atpos = 0, image = TRUE)

# Default perspective views
persp (heli.rsm, ~x1+x2+x3+x4, at = xs(heli.rsm))

# Same plots, souped-up with facet coloring and axis labeling
persp (heli.rsm, ~x1+x2+x3+x4, at = xs(heli.rsm),
    contours = "col", col = rainbow(40), zlab = "Flight time",
  xlabs = c("Wing area", "Wing length", "Body width", "Body length"))
  
## Not run: 
##D ### Hints for creating graphics files for use in publications...
##D 
##D # Save perspective plots in one PDF file (will be six pages long)
##D pdf(file = "heli-plots.pdf")
##D persp (heli.rsm, ~x1+x2+x3+x4, at = xs(heli.rsm))
##D dev.off()
##D 
##D # Save perspective plots in six separate PNG files
##D png.hook = list(
##D     pre.plot = function(lab) 
##D         png(file = paste(lab[3], lab[4], ".png", sep = "")),
##D     post.plot = function(lab)
##D         dev.off())
##D persp (heli.rsm, ~x1+x2+x3+x4, at = xs(heli.rsm), hook = png.hook)
## End(Not run) 



