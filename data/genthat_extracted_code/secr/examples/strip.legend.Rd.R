library(secr)


### Name: strip.legend
### Title: Colour Strip Legend
### Aliases: strip.legend
### Keywords: hplot

### ** Examples



temptrap <- make.grid()
tempmask <- make.mask(temptrap)
covariates (tempmask) <- data.frame(circle = 
    exp(-(tempmask$x^2 + tempmask$y^2)/10000) )
tmpleg <- plot (tempmask, covariate = "circle", dots = FALSE, 
    breaks = 10, legend = FALSE)
strip.legend (xy = 'topright', col = terrain.colors(10),
    legend = tmpleg, title = "Test plot")

## Not run: 
##D ## a custom axis using the returned values
##D par(mar = c(2,2,2,6))
##D plot (tempmask, covariate = "circle", dots = FALSE, 
##D     breaks = 10, legend = FALSE)
##D b <- strip.legend (locator(1), col = terrain.colors(10),
##D     legendtype = "other", legend = "    ", title = "Test plot",
##D      height = 0.3, box = NA)
##D axis(side = 4, pos = b[2]+5, at = seq(b[4], b[3], length = 3),
##D     lab = seq(0,1,0.5), las = 1, tck = -0.02)
##D par(mar = c(5,4,4,2) + 0.1)  ## reset to default
##D 
## End(Not run)



