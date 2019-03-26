library(ade4)


### Name: atya
### Title: Genetic variability of Cacadors
### Aliases: atya
### Keywords: datasets

### ** Examples

## Not run: 
##D data(atya)
##D if(requireNamespace("pixmap", quietly = TRUE)) {
##D   atya.digi <- pixmap::read.pnm(system.file("pictures/atyadigi.pnm",
##D       package = "ade4"))
##D   atya.carto <- pixmap::read.pnm(system.file("pictures/atyacarto.pnm",
##D       package = "ade4"))
##D   par(mfrow = c(1, 2))
##D   pixmap:::plot(atya.digi)
##D   pixmap:::plot(atya.carto)
##D   points(atya$xy, pch = 20, cex = 2)
##D }
##D if(requireNamespace("spdep", quietly = TRUE)) {
##D   plot(neig2nb(atya$neig), atya$xy, col = "red", add = TRUE, lwd = 2)
##D   par(mfrow = c(1,1))
##D }
## End(Not run)


