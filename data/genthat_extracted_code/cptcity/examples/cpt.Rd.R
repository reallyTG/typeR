library(cptcity)


### Name: cpt
### Title: Function to return colour palettes functions from 'cpt-city'
### Aliases: cpt

### ** Examples

{
library(cptcity)
image(matrix(1:100), col = cpt(pal = "mpl_inferno"))
find_cpt("temperature")
image(matrix(1:100), col = cpt("idv_temperature"))
## Not run: 
##D # Do not run
##D library(ggplot2)
##D ggplot(faithfuld, aes(waiting, eruptions)) +
##D geom_raster(aes(fill = density))
##D 
##D  ggplot(faithfuld, aes(waiting, eruptions)) +
##D  geom_raster(aes(fill = density)) +
##D  scale_fill_gradientn(colours = cpt(n = 100))
## End(Not run)
}



