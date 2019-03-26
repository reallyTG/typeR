library(spectacles)


### Name: melt_spectra
### Title: Melts the spectra data of a Spectra object and returns it as
###   wide format.
### Aliases: melt_spectra melt_spectra-methods melt_spectra,Spectra-method
###   melt_spectra,SpectraDataFrame-method
###   melt_spectra,SpectraDataFrame-method

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Simple melt
r <- melt_spectra(australia)
head(r)

## Not run: 
##D # Melt against some factor (or continuous data), and plot
##D # using ggplot2
##D 
##D # Create some factor
##D australia$fact <- sample(LETTERS[1:3], size = nrow(australia), replace = TRUE)
##D r <- melt_spectra(australia, attr = 'fact')
##D 
##D # Create plot
##D library(ggplot2)
##D p <- ggplot(r) + geom_line(aes(x=wl, y=nir, group=id, colour=fact)) + theme_bw()
##D print(p)
## End(Not run)




