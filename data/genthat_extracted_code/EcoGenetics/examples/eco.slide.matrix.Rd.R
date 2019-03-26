library(EcoGenetics)


### Name: eco.slide.matrix
### Title: Sliding window for matrix data
### Aliases: eco.slide.matrix

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D ras <- matrix(eco[["P"]][, 1], 15, 15)
##D image(ras)
##D ras.square <- eco.slide.matrix(ras, 1, 1, mean, "square")
##D image(ras.square)
##D 
##D # or allowing more control over the function:
##D ras.square <- eco.slide.matrix(ras, r = 3, slide = 1, function(x) mean(x, na.rm = TRUE), "square")
##D image(ras.square)
##D 
##D # sliding a circle:
##D ras.circle <- eco.slide.matrix(ras, r = 3, slide = 1, mean, "circle", within = FALSE)
##D image(ras.circle) 
##D 
## End(Not run)




