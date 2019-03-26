library(pavo)


### Name: adjacent
### Title: Run an adjacency and boundary strength analysis
### Aliases: adjacent

### ** Examples

## Not run: 
##D # Set a seed, for reproducibility
##D set.seed(153)
##D 
##D # Single image
##D papilio <- getimg(system.file("testdata/images/papilio.png", package = 'pavo'))
##D papilio_class <- classify(papilio, kcols = 4)
##D papilio_adj <- adjacent(papilio_class, xpts = 150, xscale = 100)
##D 
##D # Single image, with (fake) color distances and hsl values
##D # Fake color distances
##D distances <- data.frame(c1 = c(1, 1, 1, 2, 2, 3),
##D                         c2 = c(2, 3, 4, 3, 4, 4),
##D                         dS = c(5.3, 3.5, 5.7, 2.9, 6.1, 3.2),
##D                         dL = c(5.5, 6.6, 3.3, 2.2, 4.4, 6.6))
##D 
##D # Fake hue, saturation, luminance values
##D hsl_vals <- data.frame(patch = 1:4,
##D                        hue = c(1.5, 2.2, 1.0, 0.5),
##D                        lum = c(10, 5, 7, 3),
##D                        sat = c(3.5, 1.1, 6.3, 1.3))
##D 
##D # Full analysis, including the white background's ID
##D papilio_adj <- adjacent(papilio_class, xpts = 150, xscale = 100, bkgID = 1,
##D                         coldists = distances, hsl = hsl_vals)
##D 
##D # Multiple images
##D snakes <- getimg(system.file("testdata/images/snakes", package = 'pavo'))
##D snakes_class <- classify(snakes, kcols = 3)
##D snakes_adj <- adjacent(snakes_class, xpts = 120, xscale = c(50, 55))
## End(Not run)




