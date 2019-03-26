library(spectacles)


### Name: plot-Spectra
### Title: Plots an object inheriting from the Spectra class
### Aliases: plot-Spectra plot plot.Spectra plot,Spectra,ANY-method
###   plot.Spectra

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Default plotting method
plot(australia[1:5,])

# Default plot using ggplot2
plot(australia[1:5,], gg = TRUE)

## Not run: 
##D 
##D # Managing gaps in the spectra
##D s <- cut(australia, wl =c(-1*450:500, -1*1800:2050))
##D plot(s, gaps = TRUE)
##D plot(s, gaps = FALSE)
##D 
##D # passing various options to matplot
##D plot(
##D   australia, 
##D   lty = 1:5, 
##D   col = 'blue', 
##D   xlab = 'foo', ylab = 'bar', 
##D   ylim = c(0.4,0.6), 
##D   main = 'my plot'
##D )
##D 
##D # Using colour ramps
##D plot(
##D   australia, 
##D   lty = 1, 
##D   col = rainbow(10), 
##D   main = "It is possible to create really ugly visualisations"
##D )
##D 
##D # Example using colours given by ColorBrewer (http://colorbrewer2.org/)
##D library(RColorBrewer)
##D plot(australia, lty = 1, col = brewer.pal(n = 8, name = "Set2"))
##D 
##D # Using an attribute to group spectra
##D 
##D # Generate some kind of factor
##D australia$fact <- sample(LETTERS[1:3], size = nrow(australia), replace = TRUE) 
##D 
##D s <- aggregate_spectra(australia, fun = mean, id = 'fact')
##D plot(s, gg = TRUE, attr = 'fact')
## End(Not run)



