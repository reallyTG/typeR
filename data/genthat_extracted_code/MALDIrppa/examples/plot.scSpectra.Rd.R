library(MALDIrppa)


### Name: plot.scSpectra
### Title: Graphical summary of 'screenSpectra' objects
### Aliases: plot.scSpectra
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load example data

data(spectra) # list of MassSpectra objects
data(type)    # metadata

sc.results <- screenSpectra(spectra)
plot(sc.results)
plot(sc.results, labels = TRUE)
plot(sc.results, labels = type$SpectID)
plot(sc.results, type = "hist")
## Not run: 
##D plot(sc.results, type = "casewise", labels = type$SpectID)
## End(Not run)



